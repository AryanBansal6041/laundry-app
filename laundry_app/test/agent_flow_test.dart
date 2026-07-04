import 'package:flutter_test/flutter_test.dart';
import 'package:laundry_app/core/constants/enums.dart';
import 'package:laundry_app/features/setup/data/models/setup_models.dart';
import 'package:laundry_app/features/challans/data/models/challan_models.dart';

/// Tests that verify the agent flow models against REAL backend JSON responses.
void main() {
  group('Agent flow - real backend JSON', () {
    test('Multi-dept pickup response deserializes', () {
      final json = {
        "id": "51033759-94dc-4a23-b7ff-3a130a80a97c",
        "challan_type": "PICKUP",
        "challan_number": "CN-MULTI-001",
        "hotel_id": "08a18f18-675c-4972-b69d-2e0112f376ca",
        "agent_id": "4a6c7255-08b8-4092-967f-46e987c03614",
        "image_key": null,
        "entry_timestamp": "2026-04-04T12:00:22.576957Z",
        "last_edited_at": null,
        "edited_by": null,
        "departments": [
          {
            "id": "6a5833e7-946b-44db-bfbc-4f87f8059487",
            "dept_id": "360ca301-2637-4c76-8414-00b0c52813ef",
            "soiled_weight": "12.50",
            "fresh_weight": null,
            "items": [
              {"id": "5b01638f", "item_id": "9a1bde68", "qty": 20, "damaged_qty": 2},
              {"id": "6651d166", "item_id": "160b30c5", "qty": 15, "damaged_qty": 0}
            ]
          },
          {
            "id": "9c5c35ae-213e-4fab-a187-ad1baa7b91b0",
            "dept_id": "b60b1f12-e806-4605-afa0-e162ce19eba0",
            "soiled_weight": null,
            "fresh_weight": null,
            "items": [
              {"id": "6ba4040b", "item_id": "5202e23d", "qty": 100, "damaged_qty": 5}
            ]
          }
        ]
      };
      final resp = ChallanResponse.fromJson(json);
      expect(resp.challanNumber, "CN-MULTI-001");
      expect(resp.departments.length, 2);
      expect(resp.departments[0].soiledWeight, "12.50");
      expect(resp.departments[0].items.length, 2);
      expect(resp.departments[1].items[0].qty, 100);
    });

    test('Multi-dept delivery response deserializes', () {
      final json = {
        "id": "89fa6808-3f0b-4c88-85ae-e1ab59a4a90d",
        "challan_type": "DELIVERY",
        "challan_number": "CN-MULTI-001",
        "hotel_id": "08a18f18-675c-4972-b69d-2e0112f376ca",
        "agent_id": "4a6c7255-08b8-4092-967f-46e987c03614",
        "image_key": null,
        "entry_timestamp": "2026-04-04T12:00:22.763054Z",
        "last_edited_at": null,
        "edited_by": null,
        "departments": [
          {
            "id": "a9962a81",
            "dept_id": "360ca301-2637-4c76-8414-00b0c52813ef",
            "soiled_weight": null,
            "fresh_weight": "11.80",
            "items": [
              {"id": "8dabbab5", "item_id": "9a1bde68", "qty": 18, "damaged_qty": 0},
              {"id": "42648d2d", "item_id": "160b30c5", "qty": 15, "damaged_qty": 1}
            ]
          },
          {
            "id": "8a6cba63",
            "dept_id": "b60b1f12-e806-4605-afa0-e162ce19eba0",
            "soiled_weight": null,
            "fresh_weight": null,
            "items": [
              {"id": "069f23aa", "item_id": "5202e23d", "qty": 95, "damaged_qty": 3}
            ]
          }
        ]
      };
      final resp = ChallanResponse.fromJson(json);
      expect(resp.challanType, "DELIVERY");
      expect(resp.departments[0].freshWeight, "11.80");
      expect(resp.departments[0].soiledWeight, null);
    });

    test('Edited challan has lastEditedAt and editedBy', () {
      final json = {
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
            "id": "6a5833e7",
            "dept_id": "360ca301",
            "soiled_weight": "13.00",
            "fresh_weight": null,
            "items": [
              {"id": "5b01638f", "item_id": "9a1bde68", "qty": 22, "damaged_qty": 3}
            ]
          }
        ]
      };
      final resp = ChallanResponse.fromJson(json);
      expect(resp.lastEditedAt, isNotNull);
      expect(resp.editedBy, "4a6c7255-08b8-4092-967f-46e987c03614");
      expect(resp.departments[0].soiledWeight, "13.00");
    });

    test('Paginated history with filter', () {
      final json = {
        "total": 2,
        "page": 1,
        "page_size": 10,
        "items": [
          {
            "id": "51033759",
            "challan_type": "PICKUP",
            "challan_number": "CN-MULTI-001",
            "hotel_id": "08a18f18",
            "agent_id": "4a6c7255",
            "image_key": null,
            "entry_timestamp": "2026-04-04T12:00:22Z",
            "last_edited_at": null,
            "edited_by": null,
            "departments": []
          },
          {
            "id": "8a5f5e6f",
            "challan_type": "PICKUP",
            "challan_number": "P-001",
            "hotel_id": "08a18f18",
            "agent_id": "4a6c7255",
            "image_key": null,
            "entry_timestamp": "2026-04-04T11:41:52Z",
            "last_edited_at": null,
            "edited_by": null,
            "departments": []
          }
        ]
      };
      final resp = PaginatedChallanResponse.fromJson(json);
      expect(resp.total, 2);
      expect(resp.items.every((c) => c.challanType == "PICKUP"), true);
    });

    test('Form schema with multi-dept and multi-item', () {
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
              {"item_id": "9a1bde68", "name": "Bedsheet", "price_per_piece": "5.00", "calculated_weight": "0.5000"},
              {"item_id": "160b30c5", "name": "Towel", "price_per_piece": "3.00", "calculated_weight": "0.3000"}
            ]
          },
          {
            "dept_id": "b60b1f12-e806-4605-afa0-e162ce19eba0",
            "name": "Restaurant",
            "billing_type": "PIECE",
            "price_per_kg": null,
            "weight_source": null,
            "items": [
              {"item_id": "5202e23d", "name": "Napkin", "price_per_piece": "2.00", "calculated_weight": null}
            ]
          }
        ]
      };
      final resp = FormSchemaResponse.fromJson(json);
      expect(resp.departments.length, 2);
      expect(resp.departments[0].billingType, BillingType.weight);
      expect(resp.departments[0].weightSource, WeightSource.soiled);
      expect(resp.departments[0].items.length, 2);
      expect(resp.departments[1].billingType, BillingType.piece);
      expect(resp.departments[1].weightSource, null);
    });

    test('PickupSubmitRequest serializes correctly for multi-dept', () {
      final req = PickupSubmitRequest(
        challanNumber: 'CN-TEST',
        hotelId: '08a18f18-675c-4972-b69d-2e0112f376ca',
        departments: [
          ChallanDeptPayload(
            deptId: '360ca301',
            soiledWeight: 12.5,
            items: [
              ChallanItemPayload(itemId: '9a1bde68', qty: 20, damagedQty: 2),
              ChallanItemPayload(itemId: '160b30c5', qty: 15),
            ],
          ),
          ChallanDeptPayload(
            deptId: 'b60b1f12',
            items: [
              ChallanItemPayload(itemId: '5202e23d', qty: 100, damagedQty: 5),
            ],
          ),
        ],
      );
      final json = req.toJson();
      expect(json['challan_number'], 'CN-TEST');
      expect(json['departments'], isList);
      expect((json['departments'] as List).length, 2);
    });

    test('DeliverySubmitRequest serializes with fresh_weight', () {
      final req = DeliverySubmitRequest(
        challanNumber: 'CN-TEST',
        hotelId: '08a18f18',
        departments: [
          ChallanDeptPayload(
            deptId: '360ca301',
            freshWeight: 11.8,
            items: [
              ChallanItemPayload(itemId: '9a1bde68', qty: 18),
            ],
          ),
        ],
      );
      final dept = req.departments[0];
      final deptJson = dept.toJson();
      expect(deptJson['fresh_weight'], 11.8);
      expect(deptJson['soiled_weight'], null);
    });

    test('ChallanEditRequest serializes', () {
      final req = ChallanEditRequest(
        departments: [
          ChallanDeptPayload(
            deptId: '360ca301',
            soiledWeight: 13.0,
            items: [
              ChallanItemPayload(itemId: '9a1bde68', qty: 22, damagedQty: 3),
            ],
          ),
        ],
      );
      final json = req.toJson();
      expect(json['departments'], isNotNull);
    });
  });
}
