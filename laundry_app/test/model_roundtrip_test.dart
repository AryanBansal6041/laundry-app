import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:laundry_app/core/constants/enums.dart';
import 'package:laundry_app/features/admin/data/models/admin_models.dart';
import 'package:laundry_app/features/admin/data/models/dashboard_models.dart';
import 'package:laundry_app/features/auth/data/models/auth_models.dart';
import 'package:laundry_app/features/challans/data/models/challan_models.dart';
import 'package:laundry_app/features/hotel/data/models/damage_models.dart';
import 'package:laundry_app/features/hotel/data/models/hotel_dashboard_models.dart';
import 'package:laundry_app/features/hotel/data/models/tracking_models.dart';
import 'package:laundry_app/features/reports/data/models/billing_models.dart';
import 'package:laundry_app/features/setup/data/models/setup_models.dart';

void main() {
  group('7A: Enum serialization round-trips', () {
    test('UserRole round-trips', () {
      for (final role in UserRole.values) {
        final json = role.toJson();
        expect(UserRole.fromJson(json), role);
      }
      expect(UserRole.superAdmin.toJson(), 'SUPER_ADMIN');
      expect(UserRole.hotelAdmin.toJson(), 'HOTEL_ADMIN');
      expect(UserRole.serviceAgent.toJson(), 'SERVICE_AGENT');
    });

    test('BillingType round-trips', () {
      for (final bt in BillingType.values) {
        expect(BillingType.fromJson(bt.toJson()), bt);
      }
      expect(BillingType.weight.toJson(), 'WEIGHT');
      expect(BillingType.piece.toJson(), 'PIECE');
    });

    test('WeightSource round-trips', () {
      for (final ws in WeightSource.values) {
        expect(WeightSource.fromJson(ws.toJson()), ws);
      }
      expect(WeightSource.soiled.toJson(), 'SOILED');
      expect(WeightSource.calculated.toJson(), 'CALCULATED');
      expect(WeightSource.fresh.toJson(), 'FRESH');
    });

    test('ChallanType round-trips', () {
      for (final ct in ChallanType.values) {
        expect(ChallanType.fromJson(ct.toJson()), ct);
      }
      expect(ChallanType.pickup.toJson(), 'PICKUP');
      expect(ChallanType.delivery.toJson(), 'DELIVERY');
    });

    test('Invalid enum value throws', () {
      expect(() => UserRole.fromJson('INVALID'), throwsArgumentError);
      expect(() => BillingType.fromJson('INVALID'), throwsArgumentError);
      expect(() => WeightSource.fromJson('INVALID'), throwsArgumentError);
      expect(() => ChallanType.fromJson('INVALID'), throwsArgumentError);
    });
  });

  group('7A: Auth models round-trip', () {
    test('GoogleLoginRequest', () {
      final original = GoogleLoginRequest(idToken: 'test-id-token');
      final json = original.toJson();
      final pureJson = jsonDecode(jsonEncode(json)) as Map<String, dynamic>;
      final restored = GoogleLoginRequest.fromJson(pureJson);
      expect(restored.idToken, original.idToken);
    });

    test('TokenResponse', () {
      final json = {'access_token': 'jwt.token.here', 'token_type': 'bearer'};
      final model = TokenResponse.fromJson(json);
      expect(model.accessToken, 'jwt.token.here');
      expect(model.tokenType, 'bearer');
      final pureJson = jsonDecode(jsonEncode(model.toJson())) as Map<String, dynamic>;
      final roundTripped = TokenResponse.fromJson(pureJson);
      expect(roundTripped.accessToken, model.accessToken);
    });

    test('TokenResponse default tokenType', () {
      final json = {'access_token': 'jwt.token.here'};
      final model = TokenResponse.fromJson(json);
      expect(model.tokenType, 'bearer');
    });
  });

  group('7A: Admin models round-trip', () {
    test('UserCreateRequest', () {
      final original = UserCreateRequest(
        googleEmail: 'user@gmail.com',
        role: UserRole.hotelAdmin,
        displayName: 'Test User',
        phone: '+91 12345',
        hotelId: 'hotel-id',
      );
      final json = original.toJson();
      expect(json['google_email'], 'user@gmail.com');
      expect(json['display_name'], 'Test User');
      final pureJson = jsonDecode(jsonEncode(json)) as Map<String, dynamic>;
      final restored = UserCreateRequest.fromJson(pureJson);
      expect(restored.googleEmail, original.googleEmail);
      expect(restored.displayName, original.displayName);
      expect(restored.hotelId, original.hotelId);
    });

    test('UserCreateRequest with nulls', () {
      final original = UserCreateRequest(
        googleEmail: 'user@gmail.com',
        role: UserRole.serviceAgent,
      );
      final json = original.toJson();
      final pureJson = jsonDecode(jsonEncode(json)) as Map<String, dynamic>;
      final restored = UserCreateRequest.fromJson(pureJson);
      expect(restored.displayName, isNull);
      expect(restored.phone, isNull);
      expect(restored.hotelId, isNull);
    });

    test('UserResponse', () {
      final json = {
        'id': 'u-1',
        'google_email': 'user@gmail.com',
        'display_name': 'Display',
        'role': 'HOTEL_ADMIN',
        'phone': '+91 123',
        'hotel_id': 'h-1',
        'is_active': true,
        'created_at': '2026-04-04T10:00:00Z',
      };
      final model = UserResponse.fromJson(json);
      final pureJson = jsonDecode(jsonEncode(model.toJson())) as Map<String, dynamic>;
      final roundTripped = UserResponse.fromJson(pureJson);
      expect(roundTripped.id, model.id);
      expect(roundTripped.googleEmail, model.googleEmail);
      expect(roundTripped.displayName, 'Display');
      expect(roundTripped.role, UserRole.hotelAdmin);
      expect(roundTripped.isActive, true);
    });

    test('HotelCreateRequest', () {
      final original = HotelCreateRequest(
        name: 'Test Hotel',
        address: '123 Main',
        contactNumber: '+91 111',
      );
      final json = original.toJson();
      final restored = HotelCreateRequest.fromJson(json);
      expect(restored.name, original.name);
      expect(restored.address, original.address);
      expect(restored.contactNumber, original.contactNumber);
    });

    test('HotelResponse', () {
      final json = {
        'id': 'h-1',
        'name': 'Hotel',
        'address': null,
        'contact_number': null,
        'created_at': '2026-04-04T10:00:00Z',
      };
      final model = HotelResponse.fromJson(json);
      final pureJson = jsonDecode(jsonEncode(model.toJson())) as Map<String, dynamic>;
      final rt = HotelResponse.fromJson(pureJson);
      expect(rt.name, 'Hotel');
      expect(rt.address, isNull);
    });

    test('MappingCreateRequest', () {
      final original = MappingCreateRequest(agentId: 'a-1', hotelId: 'h-1');
      final json = original.toJson();
      expect(json['agent_id'], 'a-1');
      expect(json['hotel_id'], 'h-1');
      final restored = MappingCreateRequest.fromJson(json);
      expect(restored.agentId, original.agentId);
    });

    test('MappingResponse with enriched data', () {
      final json = {
        'id': 'm-1',
        'agent_id': 'a-1',
        'hotel_id': 'h-1',
        'agent_email': 'agent@test.com',
        'agent_name': 'Agent Name',
        'hotel_name': 'Hotel Name',
        'created_at': '2026-04-04T10:00:00Z',
      };
      final model = MappingResponse.fromJson(json);
      expect(model.agentEmail, 'agent@test.com');
      expect(model.agentName, 'Agent Name');
      expect(model.hotelName, 'Hotel Name');
    });

    test('MappingResponse without enriched data', () {
      final json = {
        'id': 'm-1',
        'agent_id': 'a-1',
        'hotel_id': 'h-1',
        'created_at': '2026-04-04T10:00:00Z',
      };
      final model = MappingResponse.fromJson(json);
      expect(model.agentEmail, isNull);
      expect(model.agentName, isNull);
      expect(model.hotelName, isNull);
    });
  });

  group('7A: Setup models round-trip', () {
    test('DepartmentCreateRequest WEIGHT', () {
      final original = DepartmentCreateRequest(
        name: 'Housekeeping',
        billingType: BillingType.weight,
        pricePerKg: 25.5,
        weightSource: WeightSource.soiled,
      );
      final json = original.toJson();
      final pureJson = jsonDecode(jsonEncode(json)) as Map<String, dynamic>;
      final restored = DepartmentCreateRequest.fromJson(pureJson);
      expect(restored.name, original.name);
      expect(restored.pricePerKg, original.pricePerKg);
      expect(restored.weightSource, WeightSource.soiled);
    });

    test('DepartmentCreateRequest PIECE (no weight fields)', () {
      final original = DepartmentCreateRequest(
        name: 'Restaurant',
        billingType: BillingType.piece,
      );
      final json = original.toJson();
      final pureJson = jsonDecode(jsonEncode(json)) as Map<String, dynamic>;
      final restored = DepartmentCreateRequest.fromJson(pureJson);
      expect(restored.pricePerKg, isNull);
      expect(restored.weightSource, isNull);
    });

    test('ItemCreateRequest + ItemResponse', () {
      final req = ItemCreateRequest(name: 'Towel');
      final reqJson = req.toJson();
      expect(reqJson['name'], 'Towel');

      final resp = ItemResponse.fromJson({
        'id': 'i-1',
        'name': 'Towel',
        'created_at': '2026-04-04T10:00:00Z',
      });
      expect(resp.name, 'Towel');
    });

    test('DeptItemLinkRequest + DeptItemLinkResponse', () {
      final req = DeptItemLinkRequest(
        itemId: 'i-1',
        pricePerPiece: 5.0,
        calculatedWeight: 0.5,
      );
      final json = req.toJson();
      expect(json['item_id'], 'i-1');

      final resp = DeptItemLinkResponse.fromJson({
        'id': 'dl-1',
        'dept_id': 'd-1',
        'item_id': 'i-1',
        'price_per_piece': '5.00',
        'calculated_weight': '0.5000',
        'created_at': '2026-04-04T10:00:00Z',
      });
      expect(resp.pricePerPiece, '5.00');
      expect(resp.calculatedWeight, '0.5000');
    });

    test('FormSchemaResponse with mixed depts', () {
      final json = {
        'hotel_id': 'h-1',
        'departments': [
          {
            'dept_id': 'd-1',
            'name': 'Housekeeping',
            'billing_type': 'WEIGHT',
            'price_per_kg': '25.50',
            'weight_source': 'FRESH',
            'items': [
              {'item_id': 'i-1', 'name': 'Bedsheet', 'price_per_piece': '5.00', 'calculated_weight': '0.5000'},
            ],
          },
          {
            'dept_id': 'd-2',
            'name': 'Restaurant',
            'billing_type': 'PIECE',
            'price_per_kg': null,
            'weight_source': null,
            'items': [
              {'item_id': 'i-2', 'name': 'Napkin', 'price_per_piece': '2.00', 'calculated_weight': null},
            ],
          },
        ],
      };
      final model = FormSchemaResponse.fromJson(json);
      expect(model.departments.length, 2);
      expect(model.departments[0].billingType, BillingType.weight);
      expect(model.departments[0].weightSource, WeightSource.fresh);
      expect(model.departments[1].billingType, BillingType.piece);
      expect(model.departments[1].weightSource, isNull);
    });
  });

  group('7A: Challan models round-trip', () {
    test('ChallanItemPayload', () {
      final original = ChallanItemPayload(itemId: 'i-1', qty: 10, damagedQty: 2);
      final json = original.toJson();
      expect(json['item_id'], 'i-1');
      expect(json['damaged_qty'], 2);
      final restored = ChallanItemPayload.fromJson(json);
      expect(restored.qty, 10);
    });

    test('ChallanDeptPayload with soiled weight', () {
      final original = ChallanDeptPayload(
        deptId: 'd-1',
        soiledWeight: 12.5,
        items: [ChallanItemPayload(itemId: 'i-1', qty: 5)],
      );
      final json = original.toJson();
      expect(json['soiled_weight'], 12.5);
      expect(json['fresh_weight'], isNull);
    });

    test('ChallanDeptPayload with fresh weight', () {
      final original = ChallanDeptPayload(
        deptId: 'd-1',
        freshWeight: 11.8,
        items: [ChallanItemPayload(itemId: 'i-1', qty: 5)],
      );
      final json = original.toJson();
      expect(json['fresh_weight'], 11.8);
      expect(json['soiled_weight'], isNull);
    });

    test('PickupSubmitRequest multi-dept', () {
      final req = PickupSubmitRequest(
        challanNumber: 'P-001',
        hotelId: 'h-1',
        departments: [
          ChallanDeptPayload(deptId: 'd-1', soiledWeight: 5.0, items: [
            ChallanItemPayload(itemId: 'i-1', qty: 10),
          ]),
          ChallanDeptPayload(deptId: 'd-2', items: [
            ChallanItemPayload(itemId: 'i-2', qty: 50, damagedQty: 3),
          ]),
        ],
      );
      final json = req.toJson();
      expect(json['challan_number'], 'P-001');
      expect((json['departments'] as List).length, 2);
    });

    test('DeliverySubmitRequest with fresh weight', () {
      final req = DeliverySubmitRequest(
        challanNumber: 'D-001',
        hotelId: 'h-1',
        departments: [
          ChallanDeptPayload(deptId: 'd-1', freshWeight: 4.8, items: [
            ChallanItemPayload(itemId: 'i-1', qty: 9),
          ]),
        ],
      );
      final pureJson = jsonDecode(jsonEncode(req.toJson())) as Map<String, dynamic>;
      expect((pureJson['departments'] as List)[0]['fresh_weight'], 4.8);
    });

    test('ChallanEditRequest', () {
      final req = ChallanEditRequest(departments: [
        ChallanDeptPayload(deptId: 'd-1', soiledWeight: 6.0, items: [
          ChallanItemPayload(itemId: 'i-1', qty: 12, damagedQty: 1),
        ]),
      ]);
      final json = req.toJson();
      expect(json['departments'], isNotNull);
    });

    test('ChallanResponse with nullable fields', () {
      final json = {
        'id': 'c-1',
        'challan_type': 'PICKUP',
        'challan_number': 'P-001',
        'hotel_id': 'h-1',
        'agent_id': 'a-1',
        'image_key': null,
        'entry_timestamp': '2026-04-04T10:00:00Z',
        'last_edited_at': null,
        'edited_by': null,
        'departments': [],
      };
      final model = ChallanResponse.fromJson(json);
      expect(model.challanType, 'PICKUP');
      expect(model.imageKey, isNull);
      expect(model.lastEditedAt, isNull);
      expect(model.editedBy, isNull);
    });

    test('ChallanResponse with edit fields', () {
      final json = {
        'id': 'c-1',
        'challan_type': 'DELIVERY',
        'challan_number': 'D-001',
        'hotel_id': 'h-1',
        'agent_id': 'a-1',
        'image_key': 'challans/c-1.jpg',
        'entry_timestamp': '2026-04-04T10:00:00Z',
        'last_edited_at': '2026-04-04T11:00:00Z',
        'edited_by': 'a-1',
        'departments': [
          {
            'id': 'cd-1',
            'dept_id': 'd-1',
            'soiled_weight': null,
            'fresh_weight': '4.80',
            'items': [
              {'id': 'ci-1', 'item_id': 'i-1', 'qty': 9, 'damaged_qty': 0},
            ],
          },
        ],
      };
      final model = ChallanResponse.fromJson(json);
      expect(model.imageKey, 'challans/c-1.jpg');
      expect(model.lastEditedAt, isNotNull);
      expect(model.editedBy, 'a-1');
      expect(model.departments[0].freshWeight, '4.80');
      expect(model.departments[0].soiledWeight, isNull);
    });

    test('PaginatedChallanResponse', () {
      final json = {
        'total': 50,
        'page': 2,
        'page_size': 20,
        'items': <Map<String, dynamic>>[],
      };
      final model = PaginatedChallanResponse.fromJson(json);
      expect(model.total, 50);
      expect(model.page, 2);
      expect(model.pageSize, 20);
      expect(model.items, isEmpty);
    });
  });

  group('7A: Billing models round-trip', () {
    test('BillingResponse WEIGHT dept', () {
      final json = {
        'period': {'start': '2026-04-01', 'end': '2026-04-30'},
        'hotels': [
          {
            'hotel_name': 'Hotel A',
            'departments': [
              {
                'dept_name': 'HK',
                'billing_type': 'WEIGHT',
                'total_weight_kg': 18.2,
                'rate_per_kg': 25.5,
                'soiled_weight_kg': 18.2,
                'soiled_subtotal': 464.1,
                'calculated_weight_kg': 20.5,
                'calculated_subtotal': 522.75,
                'fresh_weight_kg': 16.6,
                'fresh_subtotal': 423.3,
                'items': null,
                'subtotal': 464.1,
              },
            ],
            'damage_liability': 10.0,
            'grand_total': 454.1,
          },
        ],
      };
      final model = BillingResponse.fromJson(json);
      final dept = model.hotels[0].departments[0];
      expect(dept.billingType, 'WEIGHT');
      expect(dept.soiledWeightKg, 18.2);
      expect(dept.calculatedSubtotal, 522.75);
      expect(dept.freshWeightKg, 16.6);
      expect(dept.items, isNull);
    });

    test('BillingResponse PIECE dept', () {
      final json = {
        'period': {'start': '2026-04-01', 'end': '2026-04-30'},
        'hotels': [
          {
            'hotel_name': 'Hotel A',
            'departments': [
              {
                'dept_name': 'Restaurant',
                'billing_type': 'PIECE',
                'total_weight_kg': null,
                'rate_per_kg': null,
                'soiled_weight_kg': null,
                'soiled_subtotal': null,
                'calculated_weight_kg': null,
                'calculated_subtotal': null,
                'fresh_weight_kg': null,
                'fresh_subtotal': null,
                'items': [
                  {'item_name': 'Napkin', 'quantity': 100, 'rate': 2.0, 'subtotal': 200.0},
                ],
                'subtotal': 200.0,
              },
            ],
            'damage_liability': 0.0,
            'grand_total': 200.0,
          },
        ],
      };
      final model = BillingResponse.fromJson(json);
      final dept = model.hotels[0].departments[0];
      expect(dept.billingType, 'PIECE');
      expect(dept.totalWeightKg, isNull);
      expect(dept.items, isNotNull);
      expect(dept.items!.length, 1);
      expect(dept.items![0].quantity, 100);
    });

    test('DetailedBillingResponse multi-challan', () {
      final json = {
        'period': {'start': '2026-04-01', 'end': '2026-04-30'},
        'hotels': [
          {
            'hotel_name': 'Hotel A',
            'challans': [
              {
                'challan_number': 'P-001',
                'challan_type': 'PICKUP',
                'entry_timestamp': '2026-04-04T10:00:00Z',
                'agent_name': 'Agent',
                'departments': [
                  {
                    'dept_name': 'HK',
                    'billing_type': 'WEIGHT',
                    'soiled_weight_kg': 5.2,
                    'fresh_weight_kg': null,
                    'calculated_weight_kg': 5.0,
                    'rate_per_kg': 25.5,
                    'items': null,
                    'subtotal': 132.6,
                  },
                ],
                'challan_total': 132.6,
              },
            ],
            'damage_liability': 0.0,
            'grand_total': 132.6,
          },
        ],
      };
      final model = DetailedBillingResponse.fromJson(json);
      expect(model.hotels[0].challans[0].challanNumber, 'P-001');
      expect(model.hotels[0].challans[0].challanType, 'PICKUP');
      expect(model.hotels[0].challans[0].agentName, 'Agent');
    });
  });

  group('7A: Tracking & Damage models round-trip', () {
    test('LiveTrackingResponse', () {
      final json = {
        'hotel_id': 'h-1',
        'departments': [
          {
            'dept_name': 'HK',
            'total_weight_kg': 5.0,
            'items': [
              {'item_name': 'Bedsheet', 'qty_in_laundry': 10, 'total_damaged_by_laundry': 2, 'weight_kg': 5.0},
            ],
          },
        ],
      };
      final model = LiveTrackingResponse.fromJson(json);
      expect(model.departments[0].items[0].qtyInLaundry, 10);
      expect(model.departments[0].items[0].totalDamagedByLaundry, 2);
    });

    test('DamageReportResponse with both arrays', () {
      final json = {
        'challan_damage_summary': [
          {'hotel_id': 'h-1', 'hotel_name': 'H', 'item_id': 'i-1', 'item_name': 'Towel', 'net_damage': 3},
        ],
        'all_time_totals': [
          {'hotel_id': 'h-1', 'hotel_name': 'H', 'item_id': 'i-1', 'item_name': 'Towel', 'total_damaged_by_laundry': 10},
        ],
      };
      final model = DamageReportResponse.fromJson(json);
      expect(model.challanDamageSummary[0].netDamage, 3);
      expect(model.allTimeTotals[0].totalDamagedByLaundry, 10);
    });

    test('DamageReportResponse empty arrays', () {
      final json = {
        'challan_damage_summary': <Map<String, dynamic>>[],
        'all_time_totals': <Map<String, dynamic>>[],
      };
      final model = DamageReportResponse.fromJson(json);
      expect(model.challanDamageSummary, isEmpty);
      expect(model.allTimeTotals, isEmpty);
    });
  });

  group('7A: Dashboard models round-trip', () {
    test('SuperAdminDashboardResponse', () {
      final json = {
        'total_items_in_laundry': 25,
        'total_weight_in_laundry_kg': 12.5,
        'total_hotels': 5,
        'recent_challans': [
          {
            'challan_id': 'c-1',
            'challan_number': 'P-001',
            'challan_type': 'PICKUP',
            'hotel_name': 'Hotel A',
            'agent_name': 'Agent 1',
            'entry_timestamp': '2026-04-04T10:00:00Z',
          },
        ],
      };
      final model = SuperAdminDashboardResponse.fromJson(json);
      expect(model.totalHotels, 5);
      expect(model.recentChallans[0].hotelName, 'Hotel A');
    });

    test('HotelDashboardResponse', () {
      final json = {
        'hotel_id': 'h-1',
        'live_tracking': {
          'total_items_in_laundry': 10,
          'total_weight_in_laundry_kg': 3.5,
          'departments': [],
        },
        'recent_challans': [],
        'pending_deliveries_count': 2,
        'pending_deliveries': [],
      };
      final model = HotelDashboardResponse.fromJson(json);
      expect(model.liveTracking.totalItemsInLaundry, 10);
      expect(model.pendingDeliveriesCount, 2);
    });
  });
}
