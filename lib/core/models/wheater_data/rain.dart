import 'package:collection/collection.dart';

class Rain {
	double? h;

	Rain({this.h});

	@override
	String toString() => 'Rain(3h: $h)';

	factory Rain.fromJson(Map<String, dynamic> json) => Rain(
				h: (json['3h'] as num?)?.toDouble(),
			);

	Map<String, dynamic> toJson() => {
				'3h': h,
			};

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Rain) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => h.hashCode;
}
