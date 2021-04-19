Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41749363CBB
	for <lists+linux-doc@lfdr.de>; Mon, 19 Apr 2021 09:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237918AbhDSHi0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 19 Apr 2021 03:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237892AbhDSHi0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Apr 2021 03:38:26 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28F64C06138A
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 00:37:57 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id g17so38732344edm.6
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 00:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FGH+Ljl4s6SmZtr/mbRqxMi5iJCFYf0z8DPotTgMP2c=;
        b=Tt79F+G/2TAdJgUjgiaPsarv0YHhBXCEUblYqTOU24pMsZS1uagu3rgePN1XwY0LUx
         9iqCU+ugCogltF8rd8YUAUEbED8m8B/8Q1goX2V4qTxTfFF1CiYs44dB6Gs1TOjSLVAL
         czdY+HBJp+eMsEiV3BzGIToqO7w5XlXeW7y86JQlFseaqMMFqPwJX7Z2DW7tzw7DcKh6
         kATvEQZs+MZAmHr5gZXLYYmifwVjbfW4ZPiYB4M6vytzeLcjx+EdrvZ/fKN5IqezMpLW
         XM8CuhP0L+MYM34uHN+9m6NHF1PW/Sio0lBKzFO6HLg8bIx+1UmD9TDKP4kO4mE2f58S
         s20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FGH+Ljl4s6SmZtr/mbRqxMi5iJCFYf0z8DPotTgMP2c=;
        b=UIk1iHUArgsxWCPxl1ZABhZ9AXpM4BlKIATqfNHOE0WXJV3w/fM9CLxiHga8d375QD
         jAKGU+bnR8XcMkuw1HisQf9Jblq6Rr0obbADkrNppGBDrinpJ/3pskco6qXU4gNaGtUw
         gF3wWXTdV3XqZmOhT+tdZMf8VybntcHe5gOcsLiXRKYrdERhmM538yd0vNHWrmgKNvLD
         0GCxfeCgPruWd5rNavZVHCJxr8PbxiYl4MsnCutTdgdzPcC44Z2pzSZOzOmnpo89txKI
         gF4F3FML1KpMhU14YkR2sMtDVv/pw/1C0FJTj85Fdn8eKBuWuLuocmv1ACGUUpI+6a+x
         wZHQ==
X-Gm-Message-State: AOAM532Qfauv9kpHxa8brZ6qfqSRiQux7HYbFkenJAjB8RYI5SqRi3U2
        qzcGVVjOeXd2VXv0ANTtZ0mMHw==
X-Google-Smtp-Source: ABdhPJwGnrPSy6CHdKdWk1ZTBhMOP6j1FaF01cjyXkNWrLaKuBova+LDJbo0Zarphg4c9HFQXfxKkw==
X-Received: by 2002:a05:6402:451:: with SMTP id p17mr9123397edw.223.1618817875831;
        Mon, 19 Apr 2021 00:37:55 -0700 (PDT)
Received: from localhost.localdomain (ip5f5aeee5.dynamic.kabel-deutschland.de. [95.90.238.229])
        by smtp.googlemail.com with ESMTPSA id g22sm8701833ejz.46.2021.04.19.00.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 00:37:55 -0700 (PDT)
From:   Gioh Kim <gi-oh.kim@ionos.com>
To:     linux-block@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     axboe@kernel.dk, akinobu.mita@gmail.com, corbet@lwn.net,
        hch@infradead.org, sagi@grimberg.me, bvanassche@acm.org,
        haris.iqbal@ionos.com, jinpu.wang@ionos.com,
        Gioh Kim <gi-oh.kim@cloud.ionos.com>,
        Gioh Kim <gi-oh.kim@ionos.com>
Subject: [PATCHv5 for-next 09/19] block/rnbd-srv: Prevent a deadlock generated by accessing sysfs in parallel
Date:   Mon, 19 Apr 2021 09:37:12 +0200
Message-Id: <20210419073722.15351-10-gi-oh.kim@ionos.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419073722.15351-1-gi-oh.kim@ionos.com>
References: <20210419073722.15351-1-gi-oh.kim@ionos.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Gioh Kim <gi-oh.kim@cloud.ionos.com>

We got a warning message below.
When server tries to close one session by force, it locks the sysfs
interface and locks the srv_sess lock.
The problem is that client can send a request to close at the same time.
By close request, server locks the srv_sess lock and locks the sysfs
to remove the sysfs interfaces.

The simplest way to prevent that situation could be just use
mutex_trylock.

[  234.153965] ======================================================
[  234.154093] WARNING: possible circular locking dependency detected
[  234.154219] 5.4.84-storage #5.4.84-1+feature+linux+5.4.y+dbg+20201216.1319+b6b887b~deb10 Tainted: G           O
[  234.154381] ------------------------------------------------------
[  234.154531] kworker/1:1H/618 is trying to acquire lock:
[  234.154651] ffff8887a09db0a8 (kn->count#132){++++}, at: kernfs_remove_by_name_ns+0x40/0x80
[  234.154819]
               but task is already holding lock:
[  234.154965] ffff8887ae5f6518 (&srv_sess->lock){+.+.}, at: rnbd_srv_rdma_ev+0x144/0x1590 [rnbd_server]
[  234.155132]
               which lock already depends on the new lock.

[  234.155311]
               the existing dependency chain (in reverse order) is:
[  234.155462]
               -> #1 (&srv_sess->lock){+.+.}:
[  234.155614]        __mutex_lock+0x134/0xcb0
[  234.155761]        rnbd_srv_sess_dev_force_close+0x36/0x50 [rnbd_server]
[  234.155889]        rnbd_srv_dev_session_force_close_store+0x69/0xc0 [rnbd_server]
[  234.156042]        kernfs_fop_write+0x13f/0x240
[  234.156162]        vfs_write+0xf3/0x280
[  234.156278]        ksys_write+0xba/0x150
[  234.156395]        do_syscall_64+0x62/0x270
[  234.156513]        entry_SYSCALL_64_after_hwframe+0x49/0xbe
[  234.156632]
               -> #0 (kn->count#132){++++}:
[  234.156782]        __lock_acquire+0x129e/0x23a0
[  234.156900]        lock_acquire+0xf3/0x210
[  234.157043]        __kernfs_remove+0x42b/0x4c0
[  234.157161]        kernfs_remove_by_name_ns+0x40/0x80
[  234.157282]        remove_files+0x3f/0xa0
[  234.157399]        sysfs_remove_group+0x4a/0xb0
[  234.157519]        rnbd_srv_destroy_dev_session_sysfs+0x19/0x30 [rnbd_server]
[  234.157648]        rnbd_srv_rdma_ev+0x14c/0x1590 [rnbd_server]
[  234.157775]        process_io_req+0x29a/0x6a0 [rtrs_server]
[  234.157924]        __ib_process_cq+0x8c/0x100 [ib_core]
[  234.158709]        ib_cq_poll_work+0x31/0xb0 [ib_core]
[  234.158834]        process_one_work+0x4e5/0xaa0
[  234.158958]        worker_thread+0x65/0x5c0
[  234.159078]        kthread+0x1e0/0x200
[  234.159194]        ret_from_fork+0x24/0x30
[  234.159309]
               other info that might help us debug this:

[  234.159513]  Possible unsafe locking scenario:

[  234.159658]        CPU0                    CPU1
[  234.159775]        ----                    ----
[  234.159891]   lock(&srv_sess->lock);
[  234.160005]                                lock(kn->count#132);
[  234.160128]                                lock(&srv_sess->lock);
[  234.160250]   lock(kn->count#132);
[  234.160364]
                *** DEADLOCK ***

[  234.160536] 3 locks held by kworker/1:1H/618:
[  234.160677]  #0: ffff8883ca1ed528 ((wq_completion)ib-comp-wq){+.+.}, at: process_one_work+0x40a/0xaa0
[  234.160840]  #1: ffff8883d2d5fe10 ((work_completion)(&cq->work)){+.+.}, at: process_one_work+0x40a/0xaa0
[  234.161003]  #2: ffff8887ae5f6518 (&srv_sess->lock){+.+.}, at: rnbd_srv_rdma_ev+0x144/0x1590 [rnbd_server]
[  234.161168]
               stack backtrace:
[  234.161312] CPU: 1 PID: 618 Comm: kworker/1:1H Tainted: G           O      5.4.84-storage #5.4.84-1+feature+linux+5.4.y+dbg+20201216.1319+b6b887b~deb10
[  234.161490] Hardware name: Supermicro H8QG6/H8QG6, BIOS 3.00       09/04/2012
[  234.161643] Workqueue: ib-comp-wq ib_cq_poll_work [ib_core]
[  234.161765] Call Trace:
[  234.161910]  dump_stack+0x96/0xe0
[  234.162028]  check_noncircular+0x29e/0x2e0
[  234.162148]  ? print_circular_bug+0x100/0x100
[  234.162267]  ? register_lock_class+0x1ad/0x8a0
[  234.162385]  ? __lock_acquire+0x68e/0x23a0
[  234.162505]  ? trace_event_raw_event_lock+0x190/0x190
[  234.162626]  __lock_acquire+0x129e/0x23a0
[  234.162746]  ? register_lock_class+0x8a0/0x8a0
[  234.162866]  lock_acquire+0xf3/0x210
[  234.162982]  ? kernfs_remove_by_name_ns+0x40/0x80
[  234.163127]  __kernfs_remove+0x42b/0x4c0
[  234.163243]  ? kernfs_remove_by_name_ns+0x40/0x80
[  234.163363]  ? kernfs_fop_readdir+0x3b0/0x3b0
[  234.163482]  ? strlen+0x1f/0x40
[  234.163596]  ? strcmp+0x30/0x50
[  234.163712]  kernfs_remove_by_name_ns+0x40/0x80
[  234.163832]  remove_files+0x3f/0xa0
[  234.163948]  sysfs_remove_group+0x4a/0xb0
[  234.164068]  rnbd_srv_destroy_dev_session_sysfs+0x19/0x30 [rnbd_server]
[  234.164196]  rnbd_srv_rdma_ev+0x14c/0x1590 [rnbd_server]
[  234.164345]  ? _raw_spin_unlock_irqrestore+0x43/0x50
[  234.164466]  ? lockdep_hardirqs_on+0x1a8/0x290
[  234.164597]  ? mlx4_ib_poll_cq+0x927/0x1280 [mlx4_ib]
[  234.164732]  ? rnbd_get_sess_dev+0x270/0x270 [rnbd_server]
[  234.164859]  process_io_req+0x29a/0x6a0 [rtrs_server]
[  234.164982]  ? rnbd_get_sess_dev+0x270/0x270 [rnbd_server]
[  234.165130]  __ib_process_cq+0x8c/0x100 [ib_core]
[  234.165279]  ib_cq_poll_work+0x31/0xb0 [ib_core]
[  234.165404]  process_one_work+0x4e5/0xaa0
[  234.165550]  ? pwq_dec_nr_in_flight+0x160/0x160
[  234.165675]  ? do_raw_spin_lock+0x119/0x1d0
[  234.165796]  worker_thread+0x65/0x5c0
[  234.165914]  ? process_one_work+0xaa0/0xaa0
[  234.166031]  kthread+0x1e0/0x200
[  234.166147]  ? kthread_create_worker_on_cpu+0xc0/0xc0
[  234.166268]  ret_from_fork+0x24/0x30
[  234.251591] rnbd_server L243: </dev/loop1@close_device_session>: Device closed
[  234.604221] rnbd_server L264: RTRS Session close_device_session disconnected

Signed-off-by: Gioh Kim <gi-oh.kim@ionos.com>
Signed-off-by: Md Haris Iqbal <haris.iqbal@ionos.com>
Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
---
 drivers/block/rnbd/rnbd-srv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/block/rnbd/rnbd-srv.c b/drivers/block/rnbd/rnbd-srv.c
index a4fd9f167c18..1549a6361630 100644
--- a/drivers/block/rnbd/rnbd-srv.c
+++ b/drivers/block/rnbd/rnbd-srv.c
@@ -334,7 +334,9 @@ void rnbd_srv_sess_dev_force_close(struct rnbd_srv_sess_dev *sess_dev)
 	struct rnbd_srv_session	*sess = sess_dev->sess;
 
 	sess_dev->keep_id = true;
-	mutex_lock(&sess->lock);
+	/* It is already started to close by client's close message. */
+	if (!mutex_trylock(&sess->lock))
+		return;
 	rnbd_srv_destroy_dev_session_sysfs(sess_dev);
 	mutex_unlock(&sess->lock);
 }
-- 
2.25.1

