package com.nhl.model;

import java.io.Serializable;

public class Cart implements Serializable {
    private int totalQuantity;

    public int getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    // Nếu bạn có thêm danh sách item, có thể thêm ở đây
}
