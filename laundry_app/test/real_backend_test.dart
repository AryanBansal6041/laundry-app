import 'package:flutter_test/flutter_test.dart';
import 'package:laundry_app/core/constants/enums.dart';
import 'package:laundry_app/features/admin/data/models/admin_models.dart';
import 'package:laundry_app/features/admin/data/models/dashboard_models.dart';
import 'package:laundry_app/features/setup/data/models/setup_models.dart';
import 'package:laundry_app/features/challans/data/models/challan_models.dart';
import 'package:laundry_app/features/reports/data/models/billing_models.dart';

/// Tests that deserialize EXACT JSON from the running backend (localhost:8000).
/// These are copy-pasted from real curl responses.
void main() {
  group('Deserialize real backend responses', () {
    test('UserResponse', () {
      final json = {
        "id": "4a6c7255-08b8-4092-967f-46e987c03614",
        "google_email": "agent@test.com",
        "role": "SERVICE_AGENT",
        "phone": null,
        "hotel_id": null,
        "is_active": true,
        "created_at": "2026-04-04T11:41:32.070538Z"
      };
      final resp = UserResponse.fromJson(json);
      expect(resp.id, "4a6c7255-08b8-4092-967f-46e987c03614");
      expect(resp.googleEmail, "agent@test.com");
      expect(resp.role, UserRole.serviceAgent);
      expect(resp.isActive, true);
      expect(resp.createdAt, isA<DateTime>());
    });

    test('HotelResponse', () {
      final json = {
        "id": "08a18f18-675c-4972-b69d-2e0112f376ca",
        "name": "Hotel Sunrise",
        "address": "123 Main St",
        "contact_number": "+91 99887 76655",
        "created_at": "2026-04-04T11:41:32.187282Z"
      };
      final resp = HotelResponse.fromJson(json);
      expect(resp.name, "Hotel Sunrise");
      expect(resp.contactNumber, "+91 99887 76655");
    });

    test('MappingResponse', () {
      final json = {
        "id": "06e104e0-622b-401e-b682-a767bccf24df",
        "agent_id": "4a6c7255-08b8-4092-967f-46e987c03614",
        "hotel_id": "08a18f18-675c-4972-b69d-2e0112f376ca",
        "created_at": "2026-04-04T11:41:32.316453Z"
      };
      final resp = MappingResponse.fromJson(json);
      expect(resp.agentId, "4a6c7255-08b8-4092-967f-46e987c03614");
      expect(resp.hotelId, "08a18f18-675c-4972-b69d-2e0112f376ca");
    });

    test('DepartmentResponse', () {
      final json = {
        "id": "360ca301-2637-4c76-8414-00b0c52813ef",
        "hotel_id": "08a18f18-675c-4972-b69d-2e0112f376ca",
        "name": "Housekeeping",
        "billing_type": "WEIGHT",
        "price_per_kg": "25.50",
        "weight_source": "SOILED",
        "created_at": "2026-04-04T11:41:32.376743Z"
      };
      final resp = DepartmentResponse.fromJson(json);
      expect(resp.billingType, BillingType.weight);
      expect(resp.pricePerKg, "25.50");
      expect(resp.weightSource, WeightSource.soiled);
    });

    test('ItemResponse', () {
      final json = {
        "id": "9a1bde68-133e-4b62-aa78-b48411de5e34",
        "name": "Bedsheet",
        "created_at": "2026-04-04T11:41:41.292532Z"
      };
      final resp = ItemResponse.fromJson(json);
      expect(resp.name, "Bedsheet");
    });

    test('DeptItemLinkResponse', () {
      final json = {
        "id": "82cd84db-cf44-46ff-b12d-83c9ad4dcd2b",
        "dept_id": "360ca301-2637-4c76-8414-00b0c52813ef",
        "item_id": "9a1bde68-133e-4b62-aa78-b48411de5e34",
        "price_per_piece": "5.00",
        "calculated_weight": "0.5000",
        "created_at": "2026-04-04T11:41:41.419047Z"
      };
      final resp = DeptItemLinkResponse.fromJson(json);
      expect(resp.pricePerPiece, "5.00");
      expect(resp.calculatedWeight, "0.5000");
    });

    test('FormSchemaResponse', () {
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
              }
            ]
          }
        ]
      };
      final resp = FormSchemaResponse.fromJson(json);
      expect(resp.departments.length, 1);
      expect(resp.departments[0].items[0].calculatedWeight, "0.5000");
    });

    test('ChallanResponse (pickup)', () {
      final json = {
        "id": "8a5f5e6f-4517-42e6-8942-dad342268c46",
        "challan_type": "PICKUP",
        "challan_number": "P-001",
        "hotel_id": "08a18f18-675c-4972-b69d-2e0112f376ca",
        "agent_id": "4a6c7255-08b8-4092-967f-46e987c03614",
        "image_key": null,
        "entry_timestamp": "2026-04-04T11:41:52.449034Z",
        "last_edited_at": null,
        "edited_by": null,
        "departments": [
          {
            "id": "55dc2a4a-0719-4279-a32a-a87521f310e4",
            "dept_id": "360ca301-2637-4c76-8414-00b0c52813ef",
            "soiled_weight": "5.2",
            "fresh_weight": null,
            "items": [
              {
                "id": "8570b57b-e1fd-4502-abed-7655a582aa4e",
                "item_id": "9a1bde68-133e-4b62-aa78-b48411de5e34",
                "qty": 10,
                "damaged_qty": 1
              }
            ]
          }
        ]
      };
      final resp = ChallanResponse.fromJson(json);
      expect(resp.challanType, "PICKUP");
      expect(resp.departments[0].soiledWeight, "5.2");
      expect(resp.departments[0].items[0].damagedQty, 1);
    });

    test('ChallanResponse (delivery)', () {
      final json = {
        "id": "a7a99b48-6927-480a-90df-a7d9110c9dba",
        "challan_type": "DELIVERY",
        "challan_number": "P-001",
        "hotel_id": "08a18f18-675c-4972-b69d-2e0112f376ca",
        "agent_id": "4a6c7255-08b8-4092-967f-46e987c03614",
        "image_key": null,
        "entry_timestamp": "2026-04-04T11:42:04.908473Z",
        "last_edited_at": null,
        "edited_by": null,
        "departments": [
          {
            "id": "2773a3fb-84e3-46c9-b081-4e292fbec8df",
            "dept_id": "360ca301-2637-4c76-8414-00b0c52813ef",
            "soiled_weight": null,
            "fresh_weight": "4.8",
            "items": [
              {
                "id": "7d606071-dd71-4bed-8236-c75ee2fb1ad0",
                "item_id": "9a1bde68-133e-4b62-aa78-b48411de5e34",
                "qty": 9,
                "damaged_qty": 0
              }
            ]
          }
        ]
      };
      final resp = ChallanResponse.fromJson(json);
      expect(resp.challanType, "DELIVERY");
      expect(resp.departments[0].freshWeight, "4.8");
    });

    test('PaginatedChallanResponse', () {
      final json = {
        "total": 1,
        "page": 1,
        "page_size": 20,
        "items": [
          {
            "id": "8a5f5e6f-4517-42e6-8942-dad342268c46",
            "challan_type": "PICKUP",
            "challan_number": "P-001",
            "hotel_id": "08a18f18-675c-4972-b69d-2e0112f376ca",
            "agent_id": "4a6c7255-08b8-4092-967f-46e987c03614",
            "image_key": null,
            "entry_timestamp": "2026-04-04T11:41:52.449034Z",
            "last_edited_at": null,
            "edited_by": null,
            "departments": [
              {
                "id": "55dc2a4a-0719-4279-a32a-a87521f310e4",
                "dept_id": "360ca301-2637-4c76-8414-00b0c52813ef",
                "soiled_weight": "5.20",
                "fresh_weight": null,
                "items": [
                  {
                    "id": "8570b57b-e1fd-4502-abed-7655a582aa4e",
                    "item_id": "9a1bde68-133e-4b62-aa78-b48411de5e34",
                    "qty": 10,
                    "damaged_qty": 1
                  }
                ]
              }
            ]
          }
        ]
      };
      final resp = PaginatedChallanResponse.fromJson(json);
      expect(resp.total, 1);
      expect(resp.pageSize, 20);
      expect(resp.items[0].challanNumber, "P-001");
    });

    test('BillingResponse (summary)', () {
      final json = {
        "period": {"start": "2026-04-01", "end": "2026-04-30"},
        "hotels": [
          {
            "hotel_name": "Hotel Sunrise",
            "departments": [
              {
                "dept_name": "Housekeeping",
                "billing_type": "WEIGHT",
                "total_weight_kg": 5.2,
                "rate_per_kg": 25.5,
                "soiled_weight_kg": 5.2,
                "soiled_subtotal": 132.6,
                "calculated_weight_kg": 5.0,
                "calculated_subtotal": 127.5,
                "fresh_weight_kg": 4.8,
                "fresh_subtotal": 122.4,
                "items": null,
                "subtotal": 132.6
              }
            ],
            "damage_liability": 0.0,
            "grand_total": 132.6
          }
        ]
      };
      final resp = BillingResponse.fromJson(json);
      expect(resp.hotels[0].grandTotal, 132.6);
      expect(resp.hotels[0].departments[0].freshWeightKg, 4.8);
      expect(resp.hotels[0].departments[0].soiledSubtotal, 132.6);
    });

    test('DetailedBillingResponse', () {
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
              }
            ],
            "damage_liability": 0.0,
            "grand_total": 132.6
          }
        ]
      };
      final resp = DetailedBillingResponse.fromJson(json);
      expect(resp.hotels[0].challans[0].challanTotal, 132.6);
      expect(resp.hotels[0].challans[0].agentName, "agent@test.com");
      expect(resp.hotels[0].challans[0].departments[0].items![0].rate, null);
    });

    test('SuperAdminDashboardResponse', () {
      final json = {
        "total_items_in_laundry": 10,
        "total_weight_in_laundry_kg": 2.5,
        "total_hotels": 3,
        "recent_challans": [
          {
            "challan_id": "89fa6808-3f0b-4c88-85ae-e1ab59a4a90d",
            "challan_number": "CN-MULTI-001",
            "challan_type": "DELIVERY",
            "hotel_name": "Hotel Sunrise",
            "agent_name": "agent@test.com",
            "entry_timestamp": "2026-04-04T12:00:22.763054+00:00"
          }
        ]
      };
      final resp = SuperAdminDashboardResponse.fromJson(json);
      expect(resp.totalItemsInLaundry, 10);
      expect(resp.totalWeightInLaundryKg, 2.5);
      expect(resp.totalHotels, 3);
      expect(resp.recentChallans.length, 1);
      expect(resp.recentChallans[0].hotelName, "Hotel Sunrise");
      expect(resp.recentChallans[0].challanType, "DELIVERY");
    });
  });
}
