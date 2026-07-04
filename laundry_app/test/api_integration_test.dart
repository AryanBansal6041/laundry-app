import 'package:flutter_test/flutter_test.dart';
import 'package:laundry_app/core/constants/enums.dart';
import 'package:laundry_app/features/auth/data/models/auth_models.dart';
import 'package:laundry_app/features/admin/data/models/admin_models.dart';
import 'package:laundry_app/features/setup/data/models/setup_models.dart';
import 'package:laundry_app/features/challans/data/models/challan_models.dart';
import 'package:laundry_app/features/reports/data/models/billing_models.dart';

void main() {
  group('Model serialization from real backend JSON', () {
    test('GoogleLoginRequest serializes correctly', () {
      final req = GoogleLoginRequest(idToken: 'test-token');
      final json = req.toJson();
      expect(json['id_token'], 'test-token');
      expect(GoogleLoginRequest.fromJson(json).idToken, 'test-token');
    });

    test('TokenResponse deserializes correctly', () {
      final json = {'access_token': 'eyJ...', 'token_type': 'bearer'};
      final resp = TokenResponse.fromJson(json);
      expect(resp.accessToken, 'eyJ...');
      expect(resp.tokenType, 'bearer');
    });

    test('TokenResponse deserializes with default tokenType', () {
      final json = {'access_token': 'eyJ...'};
      final resp = TokenResponse.fromJson(json);
      expect(resp.tokenType, 'bearer');
    });

    test('UserCreateRequest serializes correctly', () {
      final req = UserCreateRequest(
        googleEmail: 'test@gmail.com',
        role: UserRole.serviceAgent,
      );
      final json = req.toJson();
      expect(json['google_email'], 'test@gmail.com');
      expect(json['role'], UserRole.serviceAgent);
    });

    test('UserResponse deserializes correctly', () {
      final json = {
        'id': '550e8400-e29b-41d4-a716-446655440000',
        'google_email': 'test@gmail.com',
        'role': 'SUPER_ADMIN',
        'phone': '+91 12345',
        'hotel_id': null,
        'is_active': true,
        'created_at': '2026-03-01T12:00:00',
      };
      final resp = UserResponse.fromJson(json);
      expect(resp.googleEmail, 'test@gmail.com');
      expect(resp.role, UserRole.superAdmin);
      expect(resp.isActive, true);
    });

    test('HotelResponse deserializes correctly', () {
      final json = {
        'id': '550e8400-e29b-41d4-a716-446655440000',
        'name': 'Hotel Sunrise',
        'address': '123 Main St',
        'contact_number': '+91 99887 76655',
        'created_at': '2026-03-01T12:00:00',
      };
      final resp = HotelResponse.fromJson(json);
      expect(resp.name, 'Hotel Sunrise');
      expect(resp.contactNumber, '+91 99887 76655');
    });

    test('FormSchemaResponse deserializes correctly', () {
      final json = {
        'hotel_id': '550e8400-e29b-41d4-a716-446655440000',
        'departments': [
          {
            'dept_id': '660e8400-e29b-41d4-a716-446655440001',
            'name': 'Housekeeping',
            'billing_type': 'WEIGHT',
            'price_per_kg': '25.50',
            'weight_source': 'SOILED',
            'items': [
              {
                'item_id': '770e8400-e29b-41d4-a716-446655440002',
                'name': 'Bedsheet',
                'price_per_piece': null,
                'calculated_weight': '0.500',
              }
            ],
          }
        ],
      };
      final resp = FormSchemaResponse.fromJson(json);
      expect(resp.departments.length, 1);
      expect(resp.departments[0].name, 'Housekeeping');
      expect(resp.departments[0].billingType, BillingType.weight);
      expect(resp.departments[0].pricePerKg, '25.50');
      expect(resp.departments[0].items[0].name, 'Bedsheet');
      expect(resp.departments[0].items[0].calculatedWeight, '0.500');
    });

    test('ChallanResponse deserializes correctly', () {
      final json = {
        'id': '550e8400-e29b-41d4-a716-446655440000',
        'challan_type': 'PICKUP',
        'challan_number': 'P-001',
        'hotel_id': '660e8400-e29b-41d4-a716-446655440001',
        'agent_id': '770e8400-e29b-41d4-a716-446655440002',
        'image_key': null,
        'entry_timestamp': '2026-03-01T12:00:00',
        'last_edited_at': null,
        'edited_by': null,
        'departments': [
          {
            'id': '880e8400-e29b-41d4-a716-446655440003',
            'dept_id': '990e8400-e29b-41d4-a716-446655440004',
            'soiled_weight': '5.200',
            'fresh_weight': null,
            'items': [
              {
                'id': 'aae8400-e29b-41d4-a716-446655440005',
                'item_id': 'bb0e8400-e29b-41d4-a716-446655440006',
                'qty': 10,
                'damaged_qty': 1,
              }
            ],
          }
        ],
      };
      final resp = ChallanResponse.fromJson(json);
      expect(resp.challanType, 'PICKUP');
      expect(resp.challanNumber, 'P-001');
      expect(resp.departments.length, 1);
      expect(resp.departments[0].soiledWeight, '5.200');
      expect(resp.departments[0].items[0].qty, 10);
      expect(resp.departments[0].items[0].damagedQty, 1);
    });

    test('PaginatedChallanResponse deserializes correctly', () {
      final json = {
        'total': 25,
        'page': 1,
        'page_size': 10,
        'items': <Map<String, dynamic>>[],
      };
      final resp = PaginatedChallanResponse.fromJson(json);
      expect(resp.total, 25);
      expect(resp.pageSize, 10);
    });

    test('BillingResponse deserializes correctly', () {
      final json = {
        'period': {'start': '2026-03-01', 'end': '2026-03-31'},
        'hotels': [
          {
            'hotel_name': 'Hotel Sunrise',
            'departments': [
              {
                'dept_name': 'Housekeeping',
                'billing_type': 'WEIGHT',
                'total_weight_kg': 150.5,
                'rate_per_kg': 25.0,
                'soiled_weight_kg': 155.0,
                'soiled_subtotal': 3875.0,
                'calculated_weight_kg': 148.0,
                'calculated_subtotal': 3700.0,
                'fresh_weight_kg': 150.5,
                'fresh_subtotal': 3762.5,
                'items': null,
                'subtotal': 3762.5,
              }
            ],
            'damage_liability': 250.0,
            'grand_total': 4012.5,
          }
        ],
      };
      final resp = BillingResponse.fromJson(json);
      expect(resp.hotels.length, 1);
      expect(resp.hotels[0].grandTotal, 4012.5);
      expect(resp.hotels[0].departments[0].freshWeightKg, 150.5);
    });

    test('DetailedBillingResponse deserializes correctly', () {
      final json = {
        'period': {'start': '2026-03-01', 'end': '2026-03-31'},
        'hotels': [
          {
            'hotel_name': 'Hotel Sunrise',
            'challans': [
              {
                'challan_number': 'P-001',
                'challan_type': 'PICKUP',
                'entry_timestamp': '2026-03-15T10:00:00',
                'agent_name': 'Rajesh Kumar',
                'departments': [
                  {
                    'dept_name': 'Housekeeping',
                    'billing_type': 'WEIGHT',
                    'soiled_weight_kg': 5.2,
                    'fresh_weight_kg': null,
                    'calculated_weight_kg': 4.8,
                    'rate_per_kg': 25.0,
                    'items': null,
                    'subtotal': 130.0,
                  }
                ],
                'challan_total': 130.0,
              }
            ],
            'damage_liability': 50.0,
            'grand_total': 180.0,
          }
        ],
      };
      final resp = DetailedBillingResponse.fromJson(json);
      expect(resp.hotels[0].challans[0].challanNumber, 'P-001');
      expect(resp.hotels[0].challans[0].departments[0].soiledWeightKg, 5.2);
    });

    test('PickupSubmitRequest serializes correctly', () {
      final req = PickupSubmitRequest(
        challanNumber: 'P-001',
        hotelId: '550e8400-e29b-41d4-a716-446655440000',
        departments: [
          ChallanDeptPayload(
            deptId: '660e8400-e29b-41d4-a716-446655440001',
            soiledWeight: 5.2,
            items: [
              ChallanItemPayload(
                itemId: '770e8400-e29b-41d4-a716-446655440002',
                qty: 10,
                damagedQty: 1,
              ),
            ],
          ),
        ],
      );
      final json = req.toJson();
      expect(json['challan_number'], 'P-001');

      // Verify nested ChallanDeptPayload serializes
      final dept = req.departments[0];
      final deptJson = dept.toJson();
      expect(deptJson['dept_id'], '660e8400-e29b-41d4-a716-446655440001');
      expect(deptJson['soiled_weight'], 5.2);

      // Verify nested ChallanItemPayload serializes
      final item = dept.items[0];
      final itemJson = item.toJson();
      expect(itemJson['item_id'], '770e8400-e29b-41d4-a716-446655440002');
      expect(itemJson['qty'], 10);
      expect(itemJson['damaged_qty'], 1);
    });
  });
}
