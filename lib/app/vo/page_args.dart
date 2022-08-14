class PageArgs {
  String? from;
  Args? args;

  PageArgs({
    this.from = "",
    this.args,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["from"] = this.from;
    data["args"] = this.args;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["page"] = this.page;
    data["length"] = this.length;
    return data;
  }
}
