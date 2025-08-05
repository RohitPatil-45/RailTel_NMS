package npm.model;

import javax.persistence.*;

import java.sql.Timestamp;
import java.time.LocalDateTime;

@Entity
@Table(name = "device_status_latency_history")
public class DeviceStatusLatencyHistoryModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "device_ip", nullable = false)
    private String deviceIp;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false)
    private Status status;

    @Column(name = "timestamp", nullable = false)
    private Timestamp timestamp;

    @Column(name = "timestamp_epoch", nullable = false)
    private Long timestampEpoch;

    @Column(name = "latency")
    private Float latency;

    @Column(name = "packetdrop")
    private Float packetdrop;

    @Column(name = "working_hour_flag")
    private Boolean workingHourFlag;

    @Column(name = "min_latency")
    private Float minLatency;

    @Column(name = "max_latency")
    private Float maxLatency;

    public enum Status {
        Up, Down
    }

    // Getters and Setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDeviceIp() {
        return deviceIp;
    }

    public void setDeviceIp(String deviceIp) {
        this.deviceIp = deviceIp;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public Long getTimestampEpoch() {
        return timestampEpoch;
    }

    public void setTimestampEpoch(Long timestampEpoch) {
        this.timestampEpoch = timestampEpoch;
    }

    public Float getLatency() {
        return latency;
    }

    public void setLatency(Float latency) {
        this.latency = latency;
    }

    public Float getPacketdrop() {
        return packetdrop;
    }

    public void setPacketdrop(Float packetdrop) {
        this.packetdrop = packetdrop;
    }

    public Boolean getWorkingHourFlag() {
        return workingHourFlag;
    }

    public void setWorkingHourFlag(Boolean workingHourFlag) {
        this.workingHourFlag = workingHourFlag;
    }

    public Float getMinLatency() {
        return minLatency;
    }

    public void setMinLatency(Float minLatency) {
        this.minLatency = minLatency;
    }

    public Float getMaxLatency() {
        return maxLatency;
    }

    public void setMaxLatency(Float maxLatency) {
        this.maxLatency = maxLatency;
    }
}
