Return-Path: <linux-doc+bounces-55114-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA625B1ACB7
	for <lists+linux-doc@lfdr.de>; Tue,  5 Aug 2025 05:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 484573BE5E4
	for <lists+linux-doc@lfdr.de>; Tue,  5 Aug 2025 03:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA65C1DE89B;
	Tue,  5 Aug 2025 03:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iDJ9cTlm"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263E819D093
	for <linux-doc@vger.kernel.org>; Tue,  5 Aug 2025 03:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754364598; cv=none; b=rSQGS6m0Fz99iKMOb5Vy4hK4idctMo/ZWMfjj2oUOJoF7YTOk2NmLcljUL72JuAfowVxMo3pwA+AZ3XjPj95KPaObHTK+PApMxhFeCubqnm/VL+QN3kRtzgadMy0JSqRwYaTF+Vy64iTllv02COwpyzXWxLBREisQ6ay0yNJjTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754364598; c=relaxed/simple;
	bh=hKNey2M65NfB1i5iWVZHmHR4W8oYtDhF8YeJMlTTAUc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Y4T1pJKWfEE9zf4hVeiKFMY9Oxt6gapjasPSyBxySrFcI3GlWMZn3G6O8e/KikTxpQVZkl257SDtCuzY1EORESOVUsQ8EVGOontJnSooNtlrpDy/PMgNPt7Cm4ymKyFPU2GmlsUzNbm/cqSqE/xmc2BsIOFHiBSZTqmZ1wTrUiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iDJ9cTlm; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b421b03d498so2747233a12.3
        for <linux-doc@vger.kernel.org>; Mon, 04 Aug 2025 20:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754364596; x=1754969396; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O4e9hLBnrm2iVH1X9AV4+u69aPgdnAgGMzmvdOS5R1s=;
        b=iDJ9cTlmtLLZlk96Z6o3SMkkhhT+x8Es2Guvx3p9d6/VyR2zNdrGn3pzE/LK8RO8zK
         T+18oP6d2FZFAei+Sd6Nr8nKsd7qic29lNDpiGCYm3zUQQ9L2NMEGLy9fgzsWywq6d+s
         0F4+AUNDmJsi5DJmrBdm9dPrIJjm/IeHFAaJxFfo3rlyJOjmoEv/CVPcf+5ml9J3G1zP
         jNagTz0k7+ChsrbnDUolFVx7sPWWYDaXU/t1WXhiANq0917USerWnrEhnnAMaT6tsU/V
         lxTjiZxkCni7PeAO+/wDuHKkbso/VW0sccU7X5wGiRunZu1PuJ/tqldV4GoYcz3WNWT9
         +DWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754364596; x=1754969396;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4e9hLBnrm2iVH1X9AV4+u69aPgdnAgGMzmvdOS5R1s=;
        b=sAKfUD8AV9i/KceaYzCJyOsJdKEN2v3qltJ45Ow/0Bjikp5qwAcDEMMLXxVbNn+KVg
         uvi++95hkMhbZCDtRCoSB4iDUKrfNYbOFLIfF77v6QSxkA7ylawprb1kZftJJRJX8cev
         ArPfnTdNbDCPoV85r92QjPUL4tGkTwIFf9/Tgwp8N6pkiOUdcHhdjDBFydoadgda5Mtk
         gf01BdDstg2NHg0kTEQ4S3kBNl/6uqb5y3DChmRmOsBqfbhqaerOwYTZ9qYqM+bGZUPe
         Ec+GgQT+LbRx2Cu+8/gEIuQTAg9yEj9ERob19CMqt8LGPaKO2BrL22RdSFYkqYIuoQwN
         L0yw==
X-Forwarded-Encrypted: i=1; AJvYcCVhjDSaB4w4bWP9Xm69XEQYzL/VOKOzFxDFnVX7rK8E5Br6E/KF8QR7+mNlC/HJCTic2wmiTjwOEU4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT8fN7BuKXnPrj+eDlaFUyY5e1159FTxC+bE2pTmAkr6WSDmfX
	CQfF40YQCuWbdFm8sOLHM2pgwWsGjMivx1O4w4uQtwm/1PFZMXlL2HrAbx90mB5pq3pMTKy8WaD
	yMv93zWMaKw==
X-Google-Smtp-Source: AGHT+IHCQb17vXlV4e52P4N0dmYJzN1VGo2n3q5QjSHbjsj9Nn7wVegPuuz3ngnDNMTzTldH9NHl9VVaoIFp
X-Received: from pfbcd26.prod.google.com ([2002:a05:6a00:421a:b0:748:ec4d:30ec])
 (user=ynaffit job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1495:b0:74c:efae:ffae
 with SMTP id d2e1a72fcca58-76bec2fca4bmr15187096b3a.5.1754364596278; Mon, 04
 Aug 2025 20:29:56 -0700 (PDT)
Date: Mon,  4 Aug 2025 20:29:40 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250805032940.3587891-4-ynaffit@google.com>
Subject: [RFC PATCH v3 0/2] cgroup: Track time in cgroup v2 freezer
From: Tiffany Yang <ynaffit@google.com>
To: linux-kernel@vger.kernel.org
Cc: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Stephen Boyd <sboyd@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, "=?UTF-8?q?Michal=20Koutn=C3=BD?=" <mkoutny@suse.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Chen Ridong <chenridong@huawei.com>, 
	kernel-team@android.com, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="true"
Content-Transfer-Encoding: quoted-printable

Hello,

The cgroup v2 freezer controller is useful for freezing background
applications so they don't contend with foreground tasks. However, this
may disrupt any internal monitoring that the application is performing,
as it may not be aware that it was frozen.

To illustrate, an application might implement a watchdog thread to
monitor a high-priority task by periodically checking its state to
ensure progress. The challenge is that the task only advances when the
application is running, but watchdog timers are set relative to system
time, not app time. If the app is frozen and misses the expected
deadline, the watchdog, unaware of this pause, may kill a healthy
process.

This series tracks the time that each cgroup spends "freezing" and
exposes it via cgroup.freeze.stat.local. If others prefer, I can instead
create cgroup.stat.local and allow the freeze time accounting to be
accessed there instead.

This version includes several basic selftests. I would find feedback
especially useful here! Along with testing basic functionality, I wanted
to demonstrate the following relationships:
  1. Freeze time will increase while a cgroup is freezing, regardless of
     whether it is frozen or not.
  2. Each cgroup's freeze time is independent from the other cgroups in
     its hierarchy.

I was hoping to show (1.) with a test that freezes a cgroup and then
checks its freeze time while cgroup.events still shows "frozen 0", but I
am having trouble writing a case that can reliably cause this (even when
letting a forkbomb grow for a while before attempting to
freeze!). Ideally, I could populate a test cgroup with an unfreezable
task. Is there an elegant way to create a process from a selftest that
will become TASK_INTERRUPTIBLE?

The main challenge in establishing (2.) is that in order to make a
meaningful comparison between two cgroups' freeze times, they need to be
obtained at around the same time. The test process may check one
cgroup's freeze time, but then it may be preempted and delayed from
checking another cgroup's for a relatively "long" time. I have tried to
use sleeps to increase what a "long" time would be, but this possibility
makes tests like test_cgfreezer_time_parent non-deterministic, so I am a
bit squeamish about adding it here.

Any suggestions for better tests or anything else would be welcome.

Thank you!
Tiffany

Signed-off-by: Tiffany Yang <ynaffit@google.com>
---
v3:
* Use seqcount along with css_set_lock to guard freeze time accesses as
  suggested by Michal Koutn=C3=BD
* Add selftests

v2: https://lore.kernel.org/lkml/20250714050008.2167786-2-ynaffit@google.co=
m/
* Track per-cgroup freezing time instead of per-task frozen time as
  suggested by Tejun Heo

v1: https://lore.kernel.org/lkml/20250603224304.3198729-3-ynaffit@google.co=
m/

Cc: John Stultz <jstultz@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Frederic Weisbecker <frederic@kernel.org>
Cc: Tejun Heo <tj@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Michal Koutn=C3=BD <mkoutny@suse.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Chen Ridong <chenridong@huawei.com>

Tiffany Yang (2):
  cgroup: cgroup.freeze.stat.local time accounting
  cgroup: selftests: Add tests for freezer time

 Documentation/admin-guide/cgroup-v2.rst       |  20 +
 include/linux/cgroup-defs.h                   |  17 +
 kernel/cgroup/cgroup.c                        |  28 +
 kernel/cgroup/freezer.c                       |  10 +-
 tools/testing/selftests/cgroup/test_freezer.c | 686 ++++++++++++++++++
 5 files changed, 759 insertions(+), 2 deletions(-)

--=20
2.50.1.565.gc32cd1483b-goog


