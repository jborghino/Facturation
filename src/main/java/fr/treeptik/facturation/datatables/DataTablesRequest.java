package fr.treeptik.facturation.datatables;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.joda.time.Interval;


public class DataTablesRequest<T> implements Serializable {
	
	private static final long serialVersionUID = 1L;

	public int sEcho;
    public int iColumns;
    public String sColumns;
    public int iDisplayStart;
    public int iDisplayLength;
    public List<String> amDataProp;
    public String sSearch;
    public List<String> asSearch;
    public boolean bRegex;
    public List<Boolean> abRegex;
    public List<Boolean> abSearchable;
    public int iSortingCols;
    public List<Integer> aiSortCol;
    public List<String> asSortDir;
    public List<Boolean> abSortable;
    public String sRangeSeparator;
    public T searchObj;
    public Map<String,Interval> msIntervals;
    public Object extraData;
}
