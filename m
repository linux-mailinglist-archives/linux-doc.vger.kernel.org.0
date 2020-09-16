Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 143D826BED7
	for <lists+linux-doc@lfdr.de>; Wed, 16 Sep 2020 10:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgIPIKz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 16 Sep 2020 04:10:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgIPIKx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Sep 2020 04:10:53 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D62D4C06174A;
        Wed, 16 Sep 2020 01:10:51 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id n10so5506410qtv.3;
        Wed, 16 Sep 2020 01:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eSv2ZUWgko7i7jwZellxTZQSsNaTqIij/qhc5aZG6Bc=;
        b=pgOvrKuxKP/nirLt88FAfqNzAfEjt4IO9hL7jSPypwUZbIXRMcPIdv35oeQXbetlb1
         VNPXQcC2bNrSriTbWv1dtydLc88x7KNj0zbMtXQNxGJFcU+F8l4DH37rPO6D0V0TXYQo
         /6sq8uz5OVsSDBNG4vZeJc6T9sx9m5CZjNQID7lSNuVw7kxkYjgPXp76KeaSEwKYMEle
         CXMOPcE/l5KVXrWpwoL/F5ifBAhGZP2IcNPMfFJKwqhkEdY4hNwsbRnH5w8fQg6Lo9Pn
         aNbQllvLBr09iGViFBiF7oUGk061DolyC/DZGxvqGsz02sXuHJ35UXwsg0sEhvZ5XeuH
         0ucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eSv2ZUWgko7i7jwZellxTZQSsNaTqIij/qhc5aZG6Bc=;
        b=Jogu1bI6Jeg6zlNyqRu25P0qd3S1UYfRf2uBFU7glwJbvliKQVnBewHDdCnjY03P0N
         z7iik+tjO51Ns5hLsxtGjFbX00tfG1lnOG2dZFx1Gu+FhQ1oMwcOm4P6cS3NWxJWIK+L
         l446NexM9q6eq7eGuf3Qm8MvEUuSjKquEaEPo5HHGIWt6vQu4G12cJSzl36yxngEKkcw
         S/trQcRtdRxeI55rUqrFIAbn39dv/NcuzxlwonNa4Ac40VEe71fNI+v4I0oM4a47lBX6
         w5vsbBqYDvQhaNq0gWksllhZcdXEH+816Va28FggYA9YRtiP9uMwmyS8CvoA8Yhh9Nwf
         iElg==
X-Gm-Message-State: AOAM532LvSLTfDanyAVMROfDhdC69cLrLNQTOlmrTJ35Y3Mn67P5AMUm
        vVDdzIfMf+DAznF995U9y58=
X-Google-Smtp-Source: ABdhPJyt6O7KNt264aPdHN4FwT9+uowXvhwaVuTgUx/wqFRblxtCtLjp6+3ODuTA9W24ZVwt0Khydg==
X-Received: by 2002:ac8:735a:: with SMTP id q26mr9331553qtp.285.1600243850428;
        Wed, 16 Sep 2020 01:10:50 -0700 (PDT)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com. [66.111.4.228])
        by smtp.gmail.com with ESMTPSA id p205sm17188065qke.2.2020.09.16.01.10.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2020 01:10:49 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailauth.nyi.internal (Postfix) with ESMTP id C985D27C005C;
        Wed, 16 Sep 2020 04:10:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 16 Sep 2020 04:10:48 -0400
X-ME-Sender: <xms:iMhhXymblGZwKFA7pi5Vfv6KR716cvq8uSnYd5T6kbUS5fRABGUlrg>
    <xme:iMhhX50CbxDCAksFOtdh2ztJvtFQ5Cf7uok5MatZvBL92gr1VqDWYM5iE3c2QbvMY
    LwwcBSeHByYjHvyDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtddvucetufdoteggodetrfdotffvucfrrh
    hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfhvghn
    ghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnh
    epvdelieegudfggeevjefhjeevueevieetjeeikedvgfejfeduheefhffggedvgeejnecu
    kfhppeehvddrudehhedrudduuddrjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpe
    epghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:iMhhXwqDuUGiNGPWoZAdM3IA57oRMasqL-vsJNhGBaG4YAq-_vIdIQ>
    <xmx:iMhhX2kz02X9Rgk49xA-D35Nq8z-SzVcnEFakuE_ONb-ovH0r-4eUA>
    <xmx:iMhhXw3-LMrKdaQwu8tbRVZkBMWKQVZGnTOB95yldV6sEKp4LfBAMQ>
    <xmx:iMhhX6oc847vVOx5hHlNS9HJMvuueSDaIEZDpSK1BNGm_s4AQo1ocg>
Received: from localhost (unknown [52.155.111.71])
        by mail.messagingengine.com (Postfix) with ESMTPA id DDEA83280064;
        Wed, 16 Sep 2020 04:10:47 -0400 (EDT)
Date:   Wed, 16 Sep 2020 16:10:46 +0800
From:   Boqun Feng <boqun.feng@gmail.com>
To:     Qian Cai <cai@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Waiman Long <longman@redhat.com>
Subject: Re: [RFC v7 11/19] lockdep: Fix recursive read lock related
 safe->unsafe detection
Message-ID: <20200916081046.GC127490@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
References: <20200807074238.1632519-1-boqun.feng@gmail.com>
 <20200807074238.1632519-12-boqun.feng@gmail.com>
 <17343f6f7f2438fc376125384133c5ba70c2a681.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17343f6f7f2438fc376125384133c5ba70c2a681.camel@redhat.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 15, 2020 at 02:32:51PM -0400, Qian Cai wrote:
> On Fri, 2020-08-07 at 15:42 +0800, Boqun Feng wrote:
> > Currently, in safe->unsafe detection, lockdep misses the fact that a
> > LOCK_ENABLED_IRQ_*_READ usage and a LOCK_USED_IN_IRQ_*_READ usage may
> > cause deadlock too, for example:
> > 
> > 	P1                          P2
> > 	<irq disabled>
> > 	write_lock(l1);             <irq enabled>
> > 				    read_lock(l2);
> > 	write_lock(l2);
> > 				    <in irq>
> > 				    read_lock(l1);
> > 
> > Actually, all of the following cases may cause deadlocks:
> > 
> > 	LOCK_USED_IN_IRQ_* -> LOCK_ENABLED_IRQ_*
> > 	LOCK_USED_IN_IRQ_*_READ -> LOCK_ENABLED_IRQ_*
> > 	LOCK_USED_IN_IRQ_* -> LOCK_ENABLED_IRQ_*_READ
> > 	LOCK_USED_IN_IRQ_*_READ -> LOCK_ENABLED_IRQ_*_READ
> > 
> > To fix this, we need to 1) change the calculation of exclusive_mask() so
> > that READ bits are not dropped and 2) always call usage() in
> > mark_lock_irq() to check usage deadlocks, even when the new usage of the
> > lock is READ.
> > 
> > Besides, adjust usage_match() and usage_acculumate() to recursive read
> > lock changes.
> > 
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> 
> So our daily CI starts to trigger a warning (graph corruption?) below. From the
> call traces, this recent patchset changed a few related things here and there.
> Does it ring any bells?
> 
> [14828.805563][T145183] lockdep bfs error:-1

-1 is BFS_EQUEUEFULL, that means we hit the size limitation in lockdep
searching, which is possible since recursive read deadlock detection
tries to make the all edges (dependencies) searched. So maybe we should
switch to DFS instead of BFS, I will look into this, in the meanwhile,
could you try the following to see if it can help on the warnings you
got?

Regards,
Boqun

------->8
index 454355c033d2..8f07bf37ab62 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -1365,7 +1365,7 @@ static int add_lock_to_list(struct lock_class *this,
 /*
  * For good efficiency of modular, we use power of 2
  */
-#define MAX_CIRCULAR_QUEUE_SIZE		4096UL
+#define MAX_CIRCULAR_QUEUE_SIZE		8192UL
 #define CQ_MASK				(MAX_CIRCULAR_QUEUE_SIZE-1)
 
 /*


> [14828.826015][T145183] WARNING: CPU: 28 PID: 145183 at kernel/locking/lockdep.c:1960 print_bfs_bug+0xfc/0x180
> [14828.871595][T145183] Modules linked in: vfio_pci vfio_virqfd vfio_iommu_type1 vfio loop nls_ascii nls_cp437 vfat fat kvm_intel kvm irqbypass efivars ip_tables x_tables sd_mod bnx2x hpsa mdio scsi_transport_sas firmware_class dm_mirror dm_region_hash dm_log dm_mod efivarfs [last unloaded: dummy_del_mod]
> [14828.994188][T145183] CPU: 28 PID: 145183 Comm: trinity-c28 Tainted: G           O      5.9.0-rc5-next-20200915+ #2
> [14829.041983][T145183] Hardware name: HP ProLiant BL660c Gen9, BIOS I38 10/17/2018
> [14829.075779][T145183] RIP: 0010:print_bfs_bug+0xfc/0x180
> [14829.099551][T145183] Code: 04 08 00 00 01 48 c7 05 4e 02 75 07 00 00 00 00 c6 05 87 02 75 07 00 45 85 e4 74 10 89 ee 48 c7 c7 e0 71 45 90 e8 78 15 0a 01 <0f> 0b 5b 5d 41 5c c3 e8 a8 74 0d 01 85 c0 74 dd 48 c7 c7 18 9f 59
> [14829.189430][T145183] RSP: 0018:ffffc90023d7ed90 EFLAGS: 00010082
> [14829.217056][T145183] RAX: 0000000000000000 RBX: ffff888ac6238040 RCX: 0000000000000027
> [14829.253274][T145183] RDX: 0000000000000027 RSI: 0000000000000004 RDI: ffff88881e29fe08
> [14829.289767][T145183] RBP: 00000000ffffffff R08: ffffed1103c53fc2 R09: ffffed1103c53fc2
> [14829.328689][T145183] R10: ffff88881e29fe0b R11: ffffed1103c53fc1 R12: 0000000000000001
> [14829.367921][T145183] R13: 0000000000000000 R14: ffff888ac6238040 R15: ffff888ac62388e8
> [14829.404156][T145183] FS:  00007f850d4a0740(0000) GS:ffff88881e280000(0000) knlGS:0000000000000000
> [14829.444478][T145183] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [14829.474221][T145183] CR2: 00007f850c3b00fc CR3: 0000000a3634a001 CR4: 00000000001706e0
> [14829.511287][T145183] DR0: 00007f850ae99000 DR1: 00007f850b399000 DR2: 0000000000000000
> [14829.548612][T145183] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000600
> [14829.586621][T145183] Call Trace:
> [14829.602266][T145183]  check_irq_usage+0x6a1/0xc30
> check_irq_usage at kernel/locking/lockdep.c:2586
> [14829.624092][T145183]  ? print_usage_bug+0x1e0/0x1e0
> [14829.646334][T145183]  ? mark_lock.part.47+0x109/0x1920
> [14829.670176][T145183]  ? print_irq_inversion_bug+0x210/0x210
> [14829.695950][T145183]  ? print_usage_bug+0x1e0/0x1e0
> [14829.718164][T145183]  ? hlock_conflict+0x54/0x1f0
> [14829.739717][T145183]  ? __bfs+0x7d/0x580
> [14829.757562][T145183]  ? mark_lock.part.47+0x109/0x1920
> [14829.780950][T145183]  ? check_path.constprop.52+0x22/0x40
> [14829.805551][T145183]  ? check_noncircular+0x14b/0x320
> [14829.831831][T145183]  ? print_circular_bug.isra.42+0x360/0x360
> [14829.860945][T145183]  ? mark_lock.part.47+0x109/0x1920
> [14829.884384][T145183]  ? print_usage_bug+0x1e0/0x1e0
> [14829.906638][T145183]  ? check_prevs_add+0x3a2/0x2720
> [14829.929349][T145183]  check_prevs_add+0x3a2/0x2720
> check_prev_add at kernel/locking/lockdep.c:2823
> (inlined by) check_prevs_add at kernel/locking/lockdep.c:2944
> [14829.951604][T145183]  ? mark_lock.part.47+0x109/0x1920
> [14829.975179][T145183]  ? __thaw_task+0x70/0x70
> [14829.995132][T145183]  ? arch_stack_walk+0xa0/0xf0
> [14830.016534][T145183]  ? check_irq_usage+0xc30/0xc30
> [14830.039256][T145183]  __lock_acquire+0x29e0/0x39c0
> [14830.061128][T145183]  ? lockdep_hardirqs_on_prepare+0x4d0/0x4d0
> [14830.088154][T145183]  ? rcu_read_lock_sched_held+0x9c/0xd0
> [14830.113159][T145183]  lock_acquire+0x1bc/0x8e0
> [14830.133453][T145183]  ? __debug_object_init+0x598/0xf50
> [14830.157250][T145183]  ? rcu_read_unlock+0x40/0x40
> [14830.178756][T145183]  ? rwlock_bug.part.1+0x90/0x90
> [14830.201096][T145183]  ? rcu_read_lock_sched_held+0x9c/0xd0
> [14830.226074][T145183]  _raw_spin_lock+0x27/0x40
> [14830.245905][T145183]  ? __debug_object_init+0x598/0xf50
> [14830.269943][T145183]  __debug_object_init+0x598/0xf50
> [14830.293271][T145183]  ? lock_downgrade+0x730/0x730
> [14830.315316][T145183]  ? mark_held_locks+0xb0/0x110
> [14830.340602][T145183]  ? debug_object_fixup+0x30/0x30
> [14830.365561][T145183]  ? lockdep_hardirqs_on_prepare+0x32b/0x4d0
> [14830.392895][T145183]  ? _raw_spin_unlock_irqrestore+0x34/0x40
> [14830.420261][T145183]  debug_object_activate+0x25c/0x4a0
> [14830.444531][T145183]  ? __delete_object+0xb3/0x100
> [14830.466404][T145183]  ? debug_object_assert_init+0x380/0x380
> [14830.492090][T145183]  ? mark_held_locks+0xb0/0x110
> [14830.513920][T145183]  ? get_object+0x90/0x90
> [14830.533650][T145183]  ? __xfs_trans_commit+0x435/0xf30
> [14830.557084][T145183]  call_rcu+0x2c/0x7a0
> [14830.575319][T145183]  ? __xfs_trans_commit+0x435/0xf30
> [14830.598880][T145183]  slab_free_freelist_hook+0xed/0x1a0
> [14830.623165][T145183]  ? __xfs_trans_commit+0x435/0xf30
> [14830.646649][T145183]  kmem_cache_free+0xec/0x590
> [14830.667871][T145183]  __xfs_trans_commit+0x435/0xf30
> [14830.690410][T145183]  ? xfs_trans_free_items+0x360/0x360
> [14830.714802][T145183]  ? xfs_trans_ichgtime+0x120/0x120
> [14830.738451][T145183]  ? _down_write_nest_lock+0x150/0x150
> [14830.763030][T145183]  xfs_vn_update_time+0x345/0x5e0
> [14830.785614][T145183]  ? xfs_init_security.isra.12+0x10/0x10
> [14830.811114][T145183]  ? __sb_start_write+0x115/0x2d0
> [14830.835603][T145183]  touch_atime+0x187/0x1d0
> [14830.858241][T145183]  ? atime_needs_update+0x560/0x560
> [14830.883515][T145183]  generic_file_buffered_read+0x1064/0x16d0
> [14830.910022][T145183]  ? pagecache_get_page+0x940/0x940
> [14830.933510][T145183]  ? rcu_read_lock_bh_held+0xb0/0xb0
> [14830.957767][T145183]  ? rcu_read_lock_sched_held+0x9c/0xd0
> [14830.982837][T145183]  ? xfs_file_buffered_aio_read+0x107/0x380
> [14831.009468][T145183]  xfs_file_buffered_aio_read+0x112/0x380
> [14831.035969][T145183]  ? find_held_lock+0x33/0x1c0
> [14831.057327][T145183]  xfs_file_read_iter+0x215/0x490
> [14831.080041][T145183]  generic_file_splice_read+0x36b/0x570
> [14831.105078][T145183]  ? pipe_to_user+0x150/0x150
> [14831.126097][T145183]  ? lockdep_init_map_waits+0x267/0x7c0
> [14831.151114][T145183]  ? debug_mutex_init+0x31/0x60
> [14831.172903][T145183]  splice_direct_to_actor+0x2cd/0x8c0
> [14831.197133][T145183]  ? pipe_to_sendpage+0x410/0x410
> [14831.219301][T145183]  ? do_splice_to+0x140/0x140
> [14831.240356][T145183]  ? lock_acquire+0x1bc/0x8e0
> [14831.261820][T145183]  ? do_sendfile+0x7c4/0xc10
> [14831.282583][T145183]  do_splice_direct+0x153/0x250
> [14831.304418][T145183]  ? rcu_read_lock_any_held+0xcd/0xf0
> [14831.328727][T145183]  ? splice_direct_to_actor+0x8c0/0x8c0
> [14831.356609][T145183]  ? __sb_start_write+0x229/0x2d0
> [14831.381737][T145183]  do_sendfile+0x397/0xc10
> [14831.402277][T145183]  ? do_pwritev+0x140/0x140
> [14831.422139][T145183]  ? __task_pid_nr_ns+0x127/0x3a0
> [14831.445366][T145183]  ? lock_downgrade+0x730/0x730
> [14831.468357][T145183]  __x64_sys_sendfile64+0x188/0x1d0
> [14831.492008][T145183]  ? __x64_sys_sendfile+0x1d0/0x1d0
> [14831.515492][T145183]  ? lockdep_hardirqs_on_prepare+0x32b/0x4d0
> [14831.542701][T145183]  ? syscall_enter_from_user_mode+0x1c/0x50
> [14831.569356][T145183]  do_syscall_64+0x33/0x40
> [14831.589219][T145183]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [14831.615913][T145183] RIP: 0033:0x7f850cdb36ed
> [14831.636624][T145183] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 6b 57 2c 00 f7 d8 64 89 01 48
> [14831.730414][T145183] RSP: 002b:00007ffe7f0106a8 EFLAGS: 00000246 ORIG_RAX: 0000000000000028
> [14831.769912][T145183] RAX: ffffffffffffffda RBX: 0000000000000028 RCX: 00007f850cdb36ed
> [14831.807052][T145183] RDX: 0000000000000000 RSI: 00000000000001a9 RDI: 000000000000014e
> [14831.846148][T145183] RBP: 0000000000000028 R08: 00000000ffffefff R09: 00000000ad1ac000
> [14831.885391][T145183] R10: 00000000000000de R11: 0000000000000246 R12: 0000000000000002
> [14831.925901][T145183] R13: 00007f850d3dc058 R14: 00007f850d4a06c0 R15: 00007f850d3dc000
> [14831.964253][T145183] CPU: 28 PID: 145183 Comm: trinity-c28 Tainted: G           O      5.9.0-rc5-next-20200915+ #2
> [14832.013770][T145183] Hardware name: HP ProLiant BL660c Gen9, BIOS I38 10/17/2018
> [14832.049176][T145183] Call Trace:
> [14832.064213][T145183]  dump_stack+0x99/0xcb
> [14832.083561][T145183]  __warn.cold.13+0xe/0x55
> [14832.104413][T145183]  ? print_bfs_bug+0xfc/0x180
> [14832.126583][T145183]  report_bug+0x1af/0x260
> [14832.146927][T145183]  handle_bug+0x44/0x80
> [14832.166010][T145183]  exc_invalid_op+0x13/0x40
> [14832.186752][T145183]  asm_exc_invalid_op+0x12/0x20
> [14832.209419][T145183] RIP: 0010:print_bfs_bug+0xfc/0x180
> [14832.233888][T145183] Code: 04 08 00 00 01 48 c7 05 4e 02 75 07 00 00 00 00 c6 05 87 02 75 07 00 45 85 e4 74 10 89 ee 48 c7 c7 e0 71 45 90 e8 78 15 0a 01 <0f> 0b 5b 5d 41 5c c3 e8 a8 74 0d 01 85 c0 74 dd 48 c7 c7 18 9f 59
> [14832.326993][T145183] RSP: 0018:ffffc90023d7ed90 EFLAGS: 00010082
> [14832.356293][T145183] RAX: 0000000000000000 RBX: ffff888ac6238040 RCX: 0000000000000027
> [14832.396354][T145183] RDX: 0000000000000027 RSI: 0000000000000004 RDI: ffff88881e29fe08
> [14832.435379][T145183] RBP: 00000000ffffffff R08: ffffed1103c53fc2 R09: ffffed1103c53fc2
> [14832.472535][T145183] R10: ffff88881e29fe0b R11: ffffed1103c53fc1 R12: 0000000000000001
> [14832.509784][T145183] R13: 0000000000000000 R14: ffff888ac6238040 R15: ffff888ac62388e8
> [14832.546738][T145183]  check_irq_usage+0x6a1/0xc30
> [14832.568603][T145183]  ? print_usage_bug+0x1e0/0x1e0
> [14832.591199][T145183]  ? mark_lock.part.47+0x109/0x1920
> [14832.616207][T145183]  ? print_irq_inversion_bug+0x210/0x210
> [14832.642117][T145183]  ? print_usage_bug+0x1e0/0x1e0
> [14832.665399][T145183]  ? hlock_conflict+0x54/0x1f0
> [14832.688110][T145183]  ? __bfs+0x7d/0x580
> [14832.706997][T145183]  ? mark_lock.part.47+0x109/0x1920
> [14832.731832][T145183]  ? check_path.constprop.52+0x22/0x40
> [14832.757443][T145183]  ? check_noncircular+0x14b/0x320
> [14832.781647][T145183]  ? print_circular_bug.isra.42+0x360/0x360
> [14832.809574][T145183]  ? mark_lock.part.47+0x109/0x1920
> [14832.833910][T145183]  ? print_usage_bug+0x1e0/0x1e0
> [14832.857359][T145183]  ? check_prevs_add+0x3a2/0x2720
> [14832.882082][T145183]  check_prevs_add+0x3a2/0x2720
> [14832.906347][T145183]  ? mark_lock.part.47+0x109/0x1920
> [14832.931692][T145183]  ? __thaw_task+0x70/0x70
> [14832.952667][T145183]  ? arch_stack_walk+0xa0/0xf0
> [14832.975451][T145183]  ? check_irq_usage+0xc30/0xc30
> [14832.998744][T145183]  __lock_acquire+0x29e0/0x39c0
> [14833.021580][T145183]  ? lockdep_hardirqs_on_prepare+0x4d0/0x4d0
> [14833.050223][T145183]  ? rcu_read_lock_sched_held+0x9c/0xd0
> [14833.076024][T145183]  lock_acquire+0x1bc/0x8e0
> [14833.097001][T145183]  ? __debug_object_init+0x598/0xf50
> [14833.121814][T145183]  ? rcu_read_unlock+0x40/0x40
> [14833.144434][T145183]  ? rwlock_bug.part.1+0x90/0x90
> [14833.167064][T145183]  ? rcu_read_lock_sched_held+0x9c/0xd0
> [14833.192689][T145183]  _raw_spin_lock+0x27/0x40
> [14833.214048][T145183]  ? __debug_object_init+0x598/0xf50
> [14833.239071][T145183]  __debug_object_init+0x598/0xf50
> [14833.263192][T145183]  ? lock_downgrade+0x730/0x730
> [14833.288021][T145183]  ? mark_held_locks+0xb0/0x110
> [14833.311062][T145183]  ? debug_object_fixup+0x30/0x30
> [14833.334906][T145183]  ? lockdep_hardirqs_on_prepare+0x32b/0x4d0
> [14833.363264][T145183]  ? _raw_spin_unlock_irqrestore+0x34/0x40
> [14833.391110][T145183]  debug_object_activate+0x25c/0x4a0
> [14833.417688][T145183]  ? __delete_object+0xb3/0x100
> [14833.441037][T145183]  ? debug_object_assert_init+0x380/0x380
> [14833.467770][T145183]  ? mark_held_locks+0xb0/0x110
> [14833.490579][T145183]  ? get_object+0x90/0x90
> [14833.510655][T145183]  ? __xfs_trans_commit+0x435/0xf30
> [14833.535194][T145183]  call_rcu+0x2c/0x7a0
> [14833.554375][T145183]  ? __xfs_trans_commit+0x435/0xf30
> [14833.578969][T145183]  slab_free_freelist_hook+0xed/0x1a0
> [14833.603774][T145183]  ? __xfs_trans_commit+0x435/0xf30
> [14833.627632][T145183]  kmem_cache_free+0xec/0x590
> [14833.649621][T145183]  __xfs_trans_commit+0x435/0xf30
> [14833.672732][T145183]  ? xfs_trans_free_items+0x360/0x360
> [14833.698161][T145183]  ? xfs_trans_ichgtime+0x120/0x120
> [14833.722806][T145183]  ? _down_write_nest_lock+0x150/0x150
> [14833.748799][T145183]  xfs_vn_update_time+0x345/0x5e0
> [14833.772690][T145183]  ? xfs_init_security.isra.12+0x10/0x10
> [14833.799516][T145183]  ? __sb_start_write+0x115/0x2d0
> [14833.823737][T145183]  touch_atime+0x187/0x1d0
> [14833.844875][T145183]  ? atime_needs_update+0x560/0x560
> [14833.870314][T145183]  generic_file_buffered_read+0x1064/0x16d0
> [14833.898953][T145183]  ? pagecache_get_page+0x940/0x940
> [14833.923985][T145183]  ? rcu_read_lock_bh_held+0xb0/0xb0
> [14833.950166][T145183]  ? rcu_read_lock_sched_held+0x9c/0xd0
> [14833.977192][T145183]  ? xfs_file_buffered_aio_read+0x107/0x380
> [14834.005370][T145183]  xfs_file_buffered_aio_read+0x112/0x380
> [14834.032303][T145183]  ? find_held_lock+0x33/0x1c0
> [14834.055381][T145183]  xfs_file_read_iter+0x215/0x490
> [14834.078876][T145183]  generic_file_splice_read+0x36b/0x570
> [14834.104809][T145183]  ? pipe_to_user+0x150/0x150
> [14834.126650][T145183]  ? lockdep_init_map_waits+0x267/0x7c0
> [14834.152610][T145183]  ? debug_mutex_init+0x31/0x60
> [14834.176068][T145183]  splice_direct_to_actor+0x2cd/0x8c0
> [14834.201764][T145183]  ? pipe_to_sendpage+0x410/0x410
> [14834.226171][T145183]  ? do_splice_to+0x140/0x140
> [14834.248455][T145183]  ? lock_acquire+0x1bc/0x8e0
> [14834.270058][T145183]  ? do_sendfile+0x7c4/0xc10
> [14834.291651][T145183]  do_splice_direct+0x153/0x250
> [14834.314677][T145183]  ? rcu_read_lock_any_held+0xcd/0xf0
> [14834.339852][T145183]  ? splice_direct_to_actor+0x8c0/0x8c0
> [14834.367457][T145183]  ? __sb_start_write+0x229/0x2d0
> [14834.391636][T145183]  do_sendfile+0x397/0xc10
> [14834.413480][T145183]  ? do_pwritev+0x140/0x140
> [14834.436208][T145183]  ? __task_pid_nr_ns+0x127/0x3a0
> [14834.461228][T145183]  ? lock_downgrade+0x730/0x730
> [14834.484859][T145183]  __x64_sys_sendfile64+0x188/0x1d0
> [14834.510071][T145183]  ? __x64_sys_sendfile+0x1d0/0x1d0
> [14834.535398][T145183]  ? lockdep_hardirqs_on_prepare+0x32b/0x4d0
> [14834.563792][T145183]  ? syscall_enter_from_user_mode+0x1c/0x50
> [14834.592028][T145183]  do_syscall_64+0x33/0x40
> [14834.612944][T145183]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [14834.640650][T145183] RIP: 0033:0x7f850cdb36ed
> [14834.661464][T145183] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 6b 57 2c 00 f7 d8 64 89 01 48
> [14834.755364][T145183] RSP: 002b:00007ffe7f0106a8 EFLAGS: 00000246 ORIG_RAX: 0000000000000028
> [14834.795590][T145183] RAX: ffffffffffffffda RBX: 0000000000000028 RCX: 00007f850cdb36ed
> [14834.833840][T145183] RDX: 0000000000000000 RSI: 00000000000001a9 RDI: 000000000000014e
> [14834.871998][T145183] RBP: 0000000000000028 R08: 00000000ffffefff R09: 00000000ad1ac000
> [14834.910057][T145183] R10: 00000000000000de R11: 0000000000000246 R12: 0000000000000002
> [14834.951023][T145183] R13: 00007f850d3dc058 R14: 00007f850d4a06c0 R15: 00007f850d3dc000
> [14834.989980][T145183] irq event stamp: 5176
> [14835.009480][T145183] hardirqs last  enabled at (5175): [<ffffffff8ff00654>] _raw_spin_unlock_irqrestore+0x34/0x40
> [14835.058951][T145183] hardirqs last disabled at (5176): [<ffffffff8ff00474>] _raw_spin_lock_irqsave+0x44/0x50
> [14835.105634][T145183] softirqs last  enabled at (4510): [<ffffffff9020061b>] __do_softirq+0x61b/0x95d
> [14835.148617][T145183] softirqs last disabled at (4503): [<ffffffff90000ec2>] asm_call_on_stack+0x12/0x20
> [14835.193016][T145183] ---[ end trace c18653e36a41b0d8 ]---
> 
