package enumClass;

public enum ColumnName {
    ID("ID"),
    BOOK_TITLE("BookTitle"),
    AUTHOR_NAME("AuthorName"),
    PRICE("Price"),
    TYPE("Type");

    private final String columnName;

    private ColumnName(String columnName) {
        this.columnName = columnName;
    }

    public String toString() {
        return columnName;
    }
}