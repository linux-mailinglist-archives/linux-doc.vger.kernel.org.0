Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D52046C9B8
	for <lists+linux-doc@lfdr.de>; Wed,  8 Dec 2021 01:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239153AbhLHBBG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 7 Dec 2021 20:01:06 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:38714 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238989AbhLHBBE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Dec 2021 20:01:04 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 967ECCE1F5C;
        Wed,  8 Dec 2021 00:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968AAC341C3;
        Wed,  8 Dec 2021 00:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638925049;
        bh=FciDfsbkk4aURLiV7DQGVTYDo+ZWM683IPpoEAq36rM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HHHv8rLxnnCD88O4Mn3Np91meqpdC0WZMeFfOTWc5W33NzVJUiVR+JdnGoKMmSz6h
         w1ucDIA/POKsC+/rxutfqgQJUqcLL8c55fWAxCNrjzIQO68jGP0AOcCwh4b7R6s24n
         zmTLj8fbl58Wbqaa3LoU0oXXhs91+YyqDwPL/+NyTRwmQ/E2b+sD+2jhRIbt00/vSk
         mSTGd/DSYWNN0hZXysd9/qDuoulZVM+3yI9cdBTu9E2nWnYd64mJmHz4s8noaZZ9lc
         GXjpbd1MWHxq6QStj9FN1PNmjnZNAD3+26ZW6djAqQr7gv7kobJugvzSHIPCderKxz
         wZe37aa3c8GIg==
From:   Eric Biggers <ebiggers@kernel.org>
To:     linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Cc:     linux-doc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, Hannes Reinecke <hare@suse.de>
Subject: [PATCH v2 7/8] docs: block: remove queue-sysfs.rst
Date:   Tue,  7 Dec 2021 16:56:39 -0800
Message-Id: <20211208005640.102814-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211208005640.102814-1-ebiggers@kernel.org>
References: <20211208005640.102814-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Eric Biggers <ebiggers@google.com>

This has been replaced by Documentation/ABI/stable/sysfs-block, which is
the correct place for sysfs documentation.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/block/index.rst       |   1 -
 Documentation/block/queue-sysfs.rst | 321 ----------------------------
 2 files changed, 322 deletions(-)
 delete mode 100644 Documentation/block/queue-sysfs.rst

diff --git a/Documentation/block/index.rst b/Documentation/block/index.rst
index 86dcf7159f990..3a41495dd77b5 100644
--- a/Documentation/block/index.rst
+++ b/Documentation/block/index.rst
@@ -20,7 +20,6 @@ Block
    kyber-iosched
    null_blk
    pr
-   queue-sysfs
    request
    stat
    switching-sched
diff --git a/Documentation/block/queue-sysfs.rst b/Documentation/block/queue-sysfs.rst
deleted file mode 100644
index 3f569d5324857..0000000000000
--- a/Documentation/block/queue-sysfs.rst
+++ /dev/null
@@ -1,321 +0,0 @@
-=================
-Queue sysfs files
-=================
-
-This text file will detail the queue files that are located in the sysfs tree
-for each block device. Note that stacked devices typically do not export
-any settings, since their queue merely functions as a remapping target.
-These files are the ones found in the /sys/block/xxx/queue/ directory.
-
-Files denoted with a RO postfix are readonly and the RW postfix means
-read-write.
-
-add_random (RW)
----------------
-This file allows to turn off the disk entropy contribution. Default
-value of this file is '1'(on).
-
-chunk_sectors (RO)
-------------------
-This has different meaning depending on the type of the block device.
-For a RAID device (dm-raid), chunk_sectors indicates the size in 512B sectors
-of the RAID volume stripe segment. For a zoned block device, either host-aware
-or host-managed, chunk_sectors indicates the size in 512B sectors of the zones
-of the device, with the eventual exception of the last zone of the device which
-may be smaller.
-
-dax (RO)
---------
-This file indicates whether the device supports Direct Access (DAX),
-used by CPU-addressable storage to bypass the pagecache.  It shows '1'
-if true, '0' if not.
-
-discard_granularity (RO)
-------------------------
-This shows the size of internal allocation of the device in bytes, if
-reported by the device. A value of '0' means device does not support
-the discard functionality.
-
-discard_max_hw_bytes (RO)
--------------------------
-Devices that support discard functionality may have internal limits on
-the number of bytes that can be trimmed or unmapped in a single operation.
-The `discard_max_hw_bytes` parameter is set by the device driver to the
-maximum number of bytes that can be discarded in a single operation.
-Discard requests issued to the device must not exceed this limit.
-A `discard_max_hw_bytes` value of 0 means that the device does not support
-discard functionality.
-
-discard_max_bytes (RW)
-----------------------
-While discard_max_hw_bytes is the hardware limit for the device, this
-setting is the software limit. Some devices exhibit large latencies when
-large discards are issued, setting this value lower will make Linux issue
-smaller discards and potentially help reduce latencies induced by large
-discard operations.
-
-discard_zeroes_data (RO)
-------------------------
-Obsolete. Always zero.
-
-fua (RO)
---------
-Whether or not the block driver supports the FUA flag for write requests.
-FUA stands for Force Unit Access. If the FUA flag is set that means that
-write requests must bypass the volatile cache of the storage device.
-
-hw_sector_size (RO)
--------------------
-This is the hardware sector size of the device, in bytes.
-
-io_poll (RW)
-------------
-When read, this file shows whether polling is enabled (1) or disabled
-(0).  Writing '0' to this file will disable polling for this device.
-Writing any non-zero value will enable this feature.
-
-io_poll_delay (RW)
-------------------
-If polling is enabled, this controls what kind of polling will be
-performed. It defaults to -1, which is classic polling. In this mode,
-the CPU will repeatedly ask for completions without giving up any time.
-If set to 0, a hybrid polling mode is used, where the kernel will attempt
-to make an educated guess at when the IO will complete. Based on this
-guess, the kernel will put the process issuing IO to sleep for an amount
-of time, before entering a classic poll loop. This mode might be a
-little slower than pure classic polling, but it will be more efficient.
-If set to a value larger than 0, the kernel will put the process issuing
-IO to sleep for this amount of microseconds before entering classic
-polling.
-
-io_timeout (RW)
----------------
-io_timeout is the request timeout in milliseconds. If a request does not
-complete in this time then the block driver timeout handler is invoked.
-That timeout handler can decide to retry the request, to fail it or to start
-a device recovery strategy.
-
-iostats (RW)
--------------
-This file is used to control (on/off) the iostats accounting of the
-disk.
-
-logical_block_size (RO)
------------------------
-This is the logical block size of the device, in bytes.
-
-max_discard_segments (RO)
--------------------------
-The maximum number of DMA scatter/gather entries in a discard request.
-
-max_hw_sectors_kb (RO)
-----------------------
-This is the maximum number of kilobytes supported in a single data transfer.
-
-max_integrity_segments (RO)
----------------------------
-Maximum number of elements in a DMA scatter/gather list with integrity
-data that will be submitted by the block layer core to the associated
-block driver.
-
-max_active_zones (RO)
----------------------
-For zoned block devices (zoned attribute indicating "host-managed" or
-"host-aware"), the sum of zones belonging to any of the zone states:
-EXPLICIT OPEN, IMPLICIT OPEN or CLOSED, is limited by this value.
-If this value is 0, there is no limit.
-
-If the host attempts to exceed this limit, the driver should report this error
-with BLK_STS_ZONE_ACTIVE_RESOURCE, which user space may see as the EOVERFLOW
-errno.
-
-max_open_zones (RO)
--------------------
-For zoned block devices (zoned attribute indicating "host-managed" or
-"host-aware"), the sum of zones belonging to any of the zone states:
-EXPLICIT OPEN or IMPLICIT OPEN, is limited by this value.
-If this value is 0, there is no limit.
-
-If the host attempts to exceed this limit, the driver should report this error
-with BLK_STS_ZONE_OPEN_RESOURCE, which user space may see as the ETOOMANYREFS
-errno.
-
-max_sectors_kb (RW)
--------------------
-This is the maximum number of kilobytes that the block layer will allow
-for a filesystem request. Must be smaller than or equal to the maximum
-size allowed by the hardware.
-
-max_segments (RO)
------------------
-Maximum number of elements in a DMA scatter/gather list that is submitted
-to the associated block driver.
-
-max_segment_size (RO)
----------------------
-Maximum size in bytes of a single element in a DMA scatter/gather list.
-
-minimum_io_size (RO)
---------------------
-This is the smallest preferred IO size reported by the device.
-
-nomerges (RW)
--------------
-This enables the user to disable the lookup logic involved with IO
-merging requests in the block layer. By default (0) all merges are
-enabled. When set to 1 only simple one-hit merges will be tried. When
-set to 2 no merge algorithms will be tried (including one-hit or more
-complex tree/hash lookups).
-
-nr_requests (RW)
-----------------
-This controls how many requests may be allocated in the block layer for
-read or write requests. Note that the total allocated number may be twice
-this amount, since it applies only to reads or writes (not the accumulated
-sum).
-
-To avoid priority inversion through request starvation, a request
-queue maintains a separate request pool per each cgroup when
-CONFIG_BLK_CGROUP is enabled, and this parameter applies to each such
-per-block-cgroup request pool.  IOW, if there are N block cgroups,
-each request queue may have up to N request pools, each independently
-regulated by nr_requests.
-
-nr_zones (RO)
--------------
-For zoned block devices (zoned attribute indicating "host-managed" or
-"host-aware"), this indicates the total number of zones of the device.
-This is always 0 for regular block devices.
-
-optimal_io_size (RO)
---------------------
-This is the optimal IO size reported by the device.
-
-physical_block_size (RO)
-------------------------
-This is the physical block size of device, in bytes.
-
-read_ahead_kb (RW)
-------------------
-Maximum number of kilobytes to read-ahead for filesystems on this block
-device.
-
-rotational (RW)
----------------
-This file is used to stat if the device is of rotational type or
-non-rotational type.
-
-rq_affinity (RW)
-----------------
-If this option is '1', the block layer will migrate request completions to the
-cpu "group" that originally submitted the request. For some workloads this
-provides a significant reduction in CPU cycles due to caching effects.
-
-For storage configurations that need to maximize distribution of completion
-processing setting this option to '2' forces the completion to run on the
-requesting cpu (bypassing the "group" aggregation logic).
-
-scheduler (RW)
---------------
-When read, this file will display the current and available IO schedulers
-for this block device. The currently active IO scheduler will be enclosed
-in [] brackets. Writing an IO scheduler name to this file will switch
-control of this block device to that new IO scheduler. Note that writing
-an IO scheduler name to this file will attempt to load that IO scheduler
-module, if it isn't already present in the system.
-
-write_cache (RW)
-----------------
-When read, this file will display whether the device has write back
-caching enabled or not. It will return "write back" for the former
-case, and "write through" for the latter. Writing to this file can
-change the kernels view of the device, but it doesn't alter the
-device state. This means that it might not be safe to toggle the
-setting from "write back" to "write through", since that will also
-eliminate cache flushes issued by the kernel.
-
-write_same_max_bytes (RO)
--------------------------
-This is the number of bytes the device can write in a single write-same
-command.  A value of '0' means write-same is not supported by this
-device.
-
-wbt_lat_usec (RW)
------------------
-If the device is registered for writeback throttling, then this file shows
-the target minimum read latency. If this latency is exceeded in a given
-window of time (see wb_window_usec), then the writeback throttling will start
-scaling back writes. Writing a value of '0' to this file disables the
-feature. Writing a value of '-1' to this file resets the value to the
-default setting.
-
-throttle_sample_time (RW)
--------------------------
-This is the time window that blk-throttle samples data, in millisecond.
-blk-throttle makes decision based on the samplings. Lower time means cgroups
-have more smooth throughput, but higher CPU overhead. This exists only when
-CONFIG_BLK_DEV_THROTTLING_LOW is enabled.
-
-write_zeroes_max_bytes (RO)
----------------------------
-For block drivers that support REQ_OP_WRITE_ZEROES, the maximum number of
-bytes that can be zeroed at once. The value 0 means that REQ_OP_WRITE_ZEROES
-is not supported.
-
-zone_append_max_bytes (RO)
---------------------------
-This is the maximum number of bytes that can be written to a sequential
-zone of a zoned block device using a zone append write operation
-(REQ_OP_ZONE_APPEND). This value is always 0 for regular block devices.
-
-zoned (RO)
-----------
-This indicates if the device is a zoned block device and the zone model of the
-device if it is indeed zoned. The possible values indicated by zoned are
-"none" for regular block devices and "host-aware" or "host-managed" for zoned
-block devices. The characteristics of host-aware and host-managed zoned block
-devices are described in the ZBC (Zoned Block Commands) and ZAC
-(Zoned Device ATA Command Set) standards. These standards also define the
-"drive-managed" zone model. However, since drive-managed zoned block devices
-do not support zone commands, they will be treated as regular block devices
-and zoned will report "none".
-
-zone_write_granularity (RO)
----------------------------
-This indicates the alignment constraint, in bytes, for write operations in
-sequential zones of zoned block devices (devices with a zoned attributed
-that reports "host-managed" or "host-aware"). This value is always 0 for
-regular block devices.
-
-independent_access_ranges (RO)
-------------------------------
-
-The presence of this sub-directory of the /sys/block/xxx/queue/ directory
-indicates that the device is capable of executing requests targeting
-different sector ranges in parallel. For instance, single LUN multi-actuator
-hard-disks will have an independent_access_ranges directory if the device
-correctly advertizes the sector ranges of its actuators.
-
-The independent_access_ranges directory contains one directory per access
-range, with each range described using the sector (RO) attribute file to
-indicate the first sector of the range and the nr_sectors (RO) attribute file
-to indicate the total number of sectors in the range starting from the first
-sector of the range.  For example, a dual-actuator hard-disk will have the
-following independent_access_ranges entries.::
-
-        $ tree /sys/block/<device>/queue/independent_access_ranges/
-        /sys/block/<device>/queue/independent_access_ranges/
-        |-- 0
-        |   |-- nr_sectors
-        |   `-- sector
-        `-- 1
-            |-- nr_sectors
-            `-- sector
-
-The sector and nr_sectors attributes use 512B sector unit, regardless of
-the actual block size of the device. Independent access ranges do not
-overlap and include all sectors within the device capacity. The access
-ranges are numbered in increasing order of the range start sector,
-that is, the sector attribute of range 0 always has the value 0.
-
-Jens Axboe <jens.axboe@oracle.com>, February 2009
-- 
2.34.1

