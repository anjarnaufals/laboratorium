class PageArgs {
  String? from;
  Args? args;

  PageArgs({
    this.from = "",
    this.args,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["from"] = from;
    data["args"] = args;
    return data;
  }
}

class Args {
  String? page;
  String? length;

  Args({
    this.page = "1",
    this.length = "10",
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["page"] = page;
    data["length"] = length;
    return data;
  }
}
