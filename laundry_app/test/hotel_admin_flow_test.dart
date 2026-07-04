import 'package:flutter_test/flutter_test.dart';
import 'package:laundry_app/features/hotel/data/models/tracking_models.dart';
import 'package:laundry_app/features/hotel/data/models/damage_models.dart';
import 'package:laundry_app/features/hotel/data/models/hotel_dashboard_models.dart';
import 'package:laundry_app/features/reports/data/models/billing_models.dart';
import 'package:laundry_app/features/challans/data/models/challan_models.dart';
import 'package:laundry_app/features/setup/data/models/setup_models.dart';
import 'package:laundry_app/features/admin/data/models/admin_models.dart';
import 'package:laundry_app/core/constants/enums.dart';

void main() {
  group('Hotel Admin flow - real backend JSON', () {
    test('LiveTrackingResponse deserializes with multiple departments', () {
      final json = {
        "hotel_id": "08a18f18-675c-4972-b69d-2e0112f376ca",
        "departments": [
          {
            "dept_name": "Housekeeping",
            "total_weight_kg": 2.5,
            "items": [
              {
                "item_name": "Bedsheet",
                "qty_in_laundry": 5,
                "total_damaged_by_laundry": 0,
                "weight_kg": 2.5
              }
            ]
          },
          {
            "dept_name": "Restaurant",
            "total_weight_kg": 0.0,
            "items": [
              {
                "item_name": "Napkin",
                "qty_in_laundry": 5,
                "total_damaged_by_laundry": 0,
                "weight_kg": 0.0
              }
            ]
          }
        ]
      };

      final tracking = LiveTrackingResponse.fromJson(json);
      expect(tracking.departments.length, 2);
      expect(tracking.departments[0].deptName, 'Housekeeping');
      expect(tracking.departments[0].totalWeightKg, 2.5);
      expect(tracking.departments[0].items[0].qtyInLaundry, 5);
      expect(tracking.departments[0].items[0].totalDamagedByLaundry, 0);
      expect(tracking.departments[1].deptName, 'Restaurant');
      expect(tracking.departments[1].items[0].itemName, 'Napkin');
    });

    test('DamageReportResponse deserializes', () {
      final json = {
        "challan_damage_summary": [
          {
            "hotel_id": "08a18f18-675c-4972-b69d-2e0112f376ca",
            "hotel_name": "Hotel Sunrise",
            "item_id": "160b30c5-a361-40b4-989c-e3f2d7154dee",
            "item_name": "Towel",
            "net_damage": 1
          },
          {
            "hotel_id": "08a18f18-675c-4972-b69d-2e0112f376ca",
            "hotel_name": "Hotel Sunrise",
            "item_id": "9a1bde68-133e-4b62-aa78-b48411de5e34",
            "item_name": "Bedsheet",
            "net_damage": 0
          }
        ],
        "all_time_totals": [
          {
            "hotel_id": "08a18f18-675c-4972-b69d-2e0112f376ca",
            "hotel_name": "Hotel Sunrise",
            "item_id": "160b30c5-a361-40b4-989c-e3f2d7154dee",
            "item_name": "Towel",
            "total_damaged_by_laundry": 1
          }
        ]
      };

      final report = DamageReportResponse.fromJson(json);
      expect(report.challanDamageSummary.length, 2);
      expect(report.challanDamageSummary[0].itemName, 'Towel');
      expect(report.challanDamageSummary[0].netDamage, 1);
      expect(report.allTimeTotals.length, 1);
      expect(report.allTimeTotals[0].totalDamagedByLaundry, 1);
    });

    test('BillingResponse (summary) with WEIGHT+PIECE departments', () {
      final json = {
        "period": {"start": "2026-04-01", "end": "2026-04-30"},
        "hotels": [
          {
            "hotel_name": "Hotel Sunrise",
            "departments": [
              {
                "dept_name": "Housekeeping",
                "billing_type": "WEIGHT",
                "total_weight_kg": 18.2,
                "rate_per_kg": 25.5,
                "soiled_weight_kg": 18.2,
                "soiled_subtotal": 464.1,
                "calculated_weight_kg": 20.5,
                "calculated_subtotal": 522.75,
                "fresh_weight_kg": 16.6,
                "fresh_subtotal": 423.3,
                "items": null,
                "subtotal": 464.1
              },
              {
                "dept_name": "Restaurant",
                "billing_type": "PIECE",
                "total_weight_kg": null,
                "rate_per_kg": null,
                "soiled_weight_kg": null,
                "soiled_subtotal": null,
                "calculated_weight_kg": null,
                "calculated_subtotal": null,
                "fresh_weight_kg": null,
                "fresh_subtotal": null,
                "items": [
                  {
                    "item_name": "Napkin",
                    "quantity": 100,
                    "rate": 2.0,
                    "subtotal": 200.0
                  }
                ],
                "subtotal": 200.0
              }
            ],
            "damage_liability": 1.0,
            "grand_total": 663.1
          }
        ]
      };

      final billing = BillingResponse.fromJson(json);
      expect(billing.hotels.length, 1);

      final hotel = billing.hotels.first;
      expect(hotel.hotelName, 'Hotel Sunrise');
      expect(hotel.grandTotal, 663.1);
      expect(hotel.damageLiability, 1.0);

      final weightDept = hotel.departments[0];
      expect(weightDept.billingType, 'WEIGHT');
      expect(weightDept.soiledWeightKg, 18.2);
      expect(weightDept.calculatedSubtotal, 522.75);
      expect(weightDept.freshWeightKg, 16.6);
      expect(weightDept.subtotal, 464.1);

      final pieceDept = hotel.departments[1];
      expect(pieceDept.billingType, 'PIECE');
      expect(pieceDept.items!.length, 1);
      expect(pieceDept.items![0].itemName, 'Napkin');
      expect(pieceDept.items![0].quantity, 100);
      expect(pieceDept.items![0].rate, 2.0);
    });

    test('BillingResponse subtotal changes with weight mode', () {
      // SOILED mode
      final soiledJson = {
        "period": {"start": "2026-04-01", "end": "2026-04-30"},
        "hotels": [
          {
            "hotel_name": "Hotel Sunrise",
            "departments": [
              {
                "dept_name": "Housekeeping",
                "billing_type": "WEIGHT",
                "total_weight_kg": 18.2,
                "rate_per_kg": 25.5,
                "soiled_weight_kg": 18.2,
                "soiled_subtotal": 464.1,
                "calculated_weight_kg": 20.5,
                "calculated_subtotal": 522.75,
                "fresh_weight_kg": 16.6,
                "fresh_subtotal": 423.3,
                "items": null,
                "subtotal": 464.1
              }
            ],
            "damage_liability": 1.0,
            "grand_total": 463.1
          }
        ]
      };

      // FRESH mode
      final freshJson = {
        "period": {"start": "2026-04-01", "end": "2026-04-30"},
        "hotels": [
          {
            "hotel_name": "Hotel Sunrise",
            "departments": [
              {
                "dept_name": "Housekeeping",
                "billing_type": "WEIGHT",
                "total_weight_kg": 16.6,
                "rate_per_kg": 25.5,
                "soiled_weight_kg": 18.2,
                "soiled_subtotal": 464.1,
                "calculated_weight_kg": 20.5,
                "calculated_subtotal": 522.75,
                "fresh_weight_kg": 16.6,
                "fresh_subtotal": 423.3,
                "items": null,
                "subtotal": 423.3
              }
            ],
            "damage_liability": 1.0,
            "grand_total": 422.3
          }
        ]
      };

      final soiled = BillingResponse.fromJson(soiledJson);
      final fresh = BillingResponse.fromJson(freshJson);

      expect(soiled.hotels[0].departments[0].subtotal, 464.1);
      expect(fresh.hotels[0].departments[0].subtotal, 423.3);
      expect(soiled.hotels[0].grandTotal, greaterThan(fresh.hotels[0].grandTotal));
    });

    test('DetailedBillingResponse with challan-level breakdown', () {
      final json = {
        "period": {"start": "2026-04-01", "end": "2026-04-30"},
        "hotels": [
          {
            "hotel_name": "Hotel Sunrise",
            "challans": [
              {
                "challan_number": "P-001",
                "challan_type": "PICKUP",
                "entry_timestamp": "2026-04-04T11:41:52.449034Z",
                "agent_name": "agent@test.com",
                "departments": [
                  {
                    "dept_name": "Housekeeping",
                    "billing_type": "WEIGHT",
                    "soiled_weight_kg": 5.2,
                    "fresh_weight_kg": 4.8,
                    "calculated_weight_kg": 5.0,
                    "rate_per_kg": 25.5,
                    "items": [
                      {"item_name": "Bedsheet", "qty": 10, "rate": null, "subtotal": null}
                    ],
                    "subtotal": 132.6
                  }
                ],
                "challan_total": 132.6
              },
              {
                "challan_number": "CN-MULTI-001",
                "challan_type": "PICKUP",
                "entry_timestamp": "2026-04-04T12:00:22.576957Z",
                "agent_name": "agent@test.com",
                "departments": [
                  {
                    "dept_name": "Housekeeping",
                    "billing_type": "WEIGHT",
                    "soiled_weight_kg": 13.0,
                    "fresh_weight_kg": 11.8,
                    "calculated_weight_kg": 15.5,
                    "rate_per_kg": 25.5,
                    "items": [
                      {"item_name": "Bedsheet", "qty": 22, "rate": null, "subtotal": null},
                      {"item_name": "Towel", "qty": 15, "rate": null, "subtotal": null}
                    ],
                    "subtotal": 331.5
                  },
                  {
                    "dept_name": "Restaurant",
                    "billing_type": "PIECE",
                    "soiled_weight_kg": null,
                    "fresh_weight_kg": null,
                    "calculated_weight_kg": null,
                    "rate_per_kg": null,
                    "items": [
                      {"item_name": "Napkin", "qty": 100, "rate": 2.0, "subtotal": 200.0}
                    ],
                    "subtotal": 200.0
                  }
                ],
                "challan_total": 531.5
              }
            ],
            "damage_liability": 1.0,
            "grand_total": 663.1
          }
        ]
      };

      final detailed = DetailedBillingResponse.fromJson(json);
      expect(detailed.hotels.length, 1);

      final hotel = detailed.hotels.first;
      expect(hotel.challans.length, 2);
      expect(hotel.grandTotal, 663.1);

      final challan1 = hotel.challans[0];
      expect(challan1.challanNumber, 'P-001');
      expect(challan1.agentName, 'agent@test.com');
      expect(challan1.departments.length, 1);
      expect(challan1.challanTotal, 132.6);

      final challan2 = hotel.challans[1];
      expect(challan2.departments.length, 2);
      expect(challan2.departments[0].billingType, 'WEIGHT');
      expect(challan2.departments[0].soiledWeightKg, 13.0);
      expect(challan2.departments[1].billingType, 'PIECE');
      expect(challan2.departments[1].items![0].rate, 2.0);
    });

    test('PaginatedChallanResponse with type filter', () {
      final json = {
        "total": 2,
        "page": 1,
        "page_size": 5,
        "items": [
          {
            "id": "51033759-94dc-4a23-b7ff-3a130a80a97c",
            "challan_type": "PICKUP",
            "challan_number": "CN-MULTI-001",
            "hotel_id": "08a18f18-675c-4972-b69d-2e0112f376ca",
            "agent_id": "4a6c7255-08b8-4092-967f-46e987c03614",
            "image_key": null,
            "entry_timestamp": "2026-04-04T12:00:22.576957Z",
            "last_edited_at": "2026-04-04T12:00:22.921650Z",
            "edited_by": "4a6c7255-08b8-4092-967f-46e987c03614",
            "departments": [
              {
                "id": "38c9aa0f-5a77-49ea-a8ca-46d451df68ab",
                "dept_id": "360ca301-2637-4c76-8414-00b0c52813ef",
                "soiled_weight": "13.00",
                "fresh_weight": null,
                "items": [
                  {"id": "6dff8e78", "item_id": "9a1bde68", "qty": 22, "damaged_qty": 3}
                ]
              }
            ]
          }
        ]
      };

      final paginated = PaginatedChallanResponse.fromJson(json);
      expect(paginated.total, 2);
      expect(paginated.items.length, 1);
      expect(paginated.items[0].challanType, 'PICKUP');
      expect(paginated.items[0].lastEditedAt, isNotNull);
    });

    test('Form schema for hotel admin name resolution', () {
      final json = {
        "hotel_id": "08a18f18-675c-4972-b69d-2e0112f376ca",
        "departments": [
          {
            "dept_id": "360ca301-2637-4c76-8414-00b0c52813ef",
            "name": "Housekeeping",
            "billing_type": "WEIGHT",
            "price_per_kg": "25.50",
            "weight_source": "SOILED",
            "items": [
              {
                "item_id": "9a1bde68-133e-4b62-aa78-b48411de5e34",
                "name": "Bedsheet",
                "price_per_piece": "5.00",
                "calculated_weight": "0.5000"
              },
              {
                "item_id": "160b30c5-a361-40b4-989c-e3f2d7154dee",
                "name": "Towel",
                "price_per_piece": "3.00",
                "calculated_weight": "0.3000"
              }
            ]
          }
        ]
      };

      final schema = FormSchemaResponse.fromJson(json);
      expect(schema.departments[0].name, 'Housekeeping');
      expect(schema.departments[0].items.length, 2);
    });

    test('HotelDashboardResponse deserializes aggregated endpoint', () {
      final json = {
        "hotel_id": "08a18f18-675c-4972-b69d-2e0112f376ca",
        "live_tracking": {
          "total_items_in_laundry": 10,
          "total_weight_in_laundry_kg": 2.5,
          "departments": [
            {
              "dept_name": "Housekeeping",
              "total_weight_kg": 2.5,
              "items": [
                {
                  "item_name": "Bedsheet",
                  "qty_in_laundry": 5,
                  "total_damaged_by_laundry": 0,
                  "weight_kg": 2.5
                }
              ]
            },
            {
              "dept_name": "Restaurant",
              "total_weight_kg": 0.0,
              "items": [
                {
                  "item_name": "Napkin",
                  "qty_in_laundry": 5,
                  "total_damaged_by_laundry": 0,
                  "weight_kg": 0.0
                }
              ]
            }
          ]
        },
        "recent_challans": [
          {
            "challan_id": "89fa6808-3f0b-4c88-85ae-e1ab59a4a90d",
            "challan_number": "CN-MULTI-001",
            "challan_type": "DELIVERY",
            "agent_name": "agent@test.com",
            "entry_timestamp": "2026-04-04T12:00:22.763054+00:00"
          },
          {
            "challan_id": "51033759-94dc-4a23-b7ff-3a130a80a97c",
            "challan_number": "CN-MULTI-001",
            "challan_type": "PICKUP",
            "agent_name": "agent@test.com",
            "entry_timestamp": "2026-04-04T12:00:22.576957+00:00"
          }
        ],
        "pending_deliveries_count": 0,
        "pending_deliveries": []
      };

      final dashboard = HotelDashboardResponse.fromJson(json);
      expect(dashboard.hotelId, '08a18f18-675c-4972-b69d-2e0112f376ca');
      expect(dashboard.liveTracking.totalItemsInLaundry, 10);
      expect(dashboard.liveTracking.totalWeightInLaundryKg, 2.5);
      expect(dashboard.liveTracking.departments.length, 2);
      expect(dashboard.recentChallans.length, 2);
      expect(dashboard.recentChallans[0].challanNumber, 'CN-MULTI-001');
      expect(dashboard.recentChallans[0].challanType, 'DELIVERY');
      expect(dashboard.recentChallans[0].agentName, 'agent@test.com');
      expect(dashboard.pendingDeliveriesCount, 0);
      expect(dashboard.pendingDeliveries, isEmpty);
    });

    test('UserResponse deserializes with display_name', () {
      final json = {
        "id": "0b72c085-9d0a-45aa-8da6-8c6110522fb0",
        "google_email": "admin@hotelsunrise.com",
        "display_name": null,
        "role": "HOTEL_ADMIN",
        "phone": null,
        "hotel_id": "08a18f18-675c-4972-b69d-2e0112f376ca",
        "is_active": true,
        "created_at": "2026-04-04T12:35:01.657640Z"
      };

      final user = UserResponse.fromJson(json);
      expect(user.displayName, isNull);
      expect(user.googleEmail, 'admin@hotelsunrise.com');
      expect(user.role, UserRole.hotelAdmin);
      expect(user.hotelId, isNotNull);

      final withName = UserResponse.fromJson({
        ...json,
        "display_name": "Sunrise Admin",
      });
      expect(withName.displayName, 'Sunrise Admin');
    });

    test('MappingResponse deserializes with enriched data', () {
      final json = {
        "id": "06e104e0-622b-401e-b682-a767bccf24df",
        "agent_id": "4a6c7255-08b8-4092-967f-46e987c03614",
        "hotel_id": "08a18f18-675c-4972-b69d-2e0112f376ca",
        "agent_email": "agent@test.com",
        "agent_name": null,
        "hotel_name": "Hotel Sunrise",
        "created_at": "2026-04-04T11:41:32.316453Z"
      };

      final mapping = MappingResponse.fromJson(json);
      expect(mapping.agentEmail, 'agent@test.com');
      expect(mapping.agentName, isNull);
      expect(mapping.hotelName, 'Hotel Sunrise');
    });

    test('DamageReportResponse with min_damage filter returns only damaged items', () {
      final json = {
        "challan_damage_summary": [
          {
            "hotel_id": "08a18f18-675c-4972-b69d-2e0112f376ca",
            "hotel_name": "Hotel Sunrise",
            "item_id": "160b30c5-a361-40b4-989c-e3f2d7154dee",
            "item_name": "Towel",
            "net_damage": 1
          }
        ],
        "all_time_totals": [
          {
            "hotel_id": "08a18f18-675c-4972-b69d-2e0112f376ca",
            "hotel_name": "Hotel Sunrise",
            "item_id": "160b30c5-a361-40b4-989c-e3f2d7154dee",
            "item_name": "Towel",
            "total_damaged_by_laundry": 1
          }
        ]
      };

      final report = DamageReportResponse.fromJson(json);
      expect(report.challanDamageSummary.length, 1);
      expect(report.challanDamageSummary.every((i) => i.netDamage >= 1), true);
    });
  });
}

