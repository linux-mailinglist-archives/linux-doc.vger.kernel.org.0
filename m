Return-Path: <linux-doc+bounces-3691-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BCD800090
	for <lists+linux-doc@lfdr.de>; Fri,  1 Dec 2023 01:52:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6925B20DBB
	for <lists+linux-doc@lfdr.de>; Fri,  1 Dec 2023 00:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988F97EC;
	Fri,  1 Dec 2023 00:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WLHN/zDn"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD4A910C2
	for <linux-doc@vger.kernel.org>; Thu, 30 Nov 2023 16:52:08 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5d04540d5aaso26725167b3.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Nov 2023 16:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701391928; x=1701996728; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D7rrSw0NQO055D8S8vjtnTn1EUTQ7K87+88fh2pqZsE=;
        b=WLHN/zDnudw72XGN7U34kCKpO9lItXRoXISxGG274BqlzUxYGE/vC8koDz324GYsvN
         TYFPJTlR+An7MSdXAmSV9aCshp/RtFPa86q7rrUFcSc5pKz8HcSq8hdlFGDWCBG6eM7J
         y9hGA+vJT9Ic2+29/gpVikI0kD1er6/+l32/amIKIg4oqELjW4AwqKGLdAEUw2UYE5Nb
         e5bVuiN1vTEJ2CAQGM8hBbqr8lFYfypzgKm8xBfr1OmuJ0F0deFNy2hmhGkHxrmNzGJI
         WPc4O8+spOEdwXZ3H9I5vvTHlEPzxxyuwmjcy5Cozz76ertBFfaj3ikaBjUjzSivZ1OO
         ihUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701391928; x=1701996728;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D7rrSw0NQO055D8S8vjtnTn1EUTQ7K87+88fh2pqZsE=;
        b=i/Ya0imwnCUVn5dk0qGHck3S35tYhssiqEo+mJ7K50g8Pg315oQtjHUa3YD8GAueQs
         3tgpruyyGIdDUt2lusTj0FgJo8Wz4ouCq/KGkiOWVdIztNVleKlTUiJH38zS9BLmXx0N
         HryBjJG7piLhJ6dinWl0xMgSZXmUHcyYKjEW2UUl82W9YLbivrEeuc07GGBHsDWtVzvo
         FiK7ShgqpJOqcPIKFadfYPtbJ6KS66OgY1uBk/Efv62QB7feGd6/tVViFqCTgT4WIuJO
         xn29XPg5VBlWoO488qGUREKWbY85btHyN5d3k+6fFkVKox/RgEqSGYizFoiAgrnqegUw
         fdPQ==
X-Gm-Message-State: AOJu0Yz1kbxd4uGCDxAaCgLfsFbCwC509ui5af7D8oyEOjWczqfoWlwP
	eAzC8Mz1ny69Q0+NKi3LJ7bkPmK73079
X-Google-Smtp-Source: AGHT+IFKvXNXIfoRHM0m0qB8MFcGuh4xxwA7sFtdSp36gULSAH59l3Gw6b036WI6Aep1yW9tQy/2NEcFOKdL
X-Received: from joshdon-desktop.svl.corp.google.com ([2620:15c:2a3:200:6088:f608:a3e0:af40])
 (user=joshdon job=sendgmr) by 2002:a05:690c:845:b0:5a8:205e:1f27 with SMTP id
 bz5-20020a05690c084500b005a8205e1f27mr755718ywb.6.1701391928055; Thu, 30 Nov
 2023 16:52:08 -0800 (PST)
Date: Thu, 30 Nov 2023 16:52:03 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231201005203.309873-1-joshdon@google.com>
Subject: [PATCH] cgroup: Fix documentation for cpu.idle
From: Josh Don <joshdon@google.com>
To: Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>
Cc: cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Josh Don <joshdon@google.com>
Content-Type: text/plain; charset="UTF-8"

Two problems:
	- cpu.idle cgroups show up with 0 weight, correct the
	  documentation to indicate this.
	- cpu.idle has no entry describing it.

Signed-off-by: Josh Don <joshdon@google.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 3f85254f3cef..9debf02bcb39 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1093,7 +1093,11 @@ All time durations are in microseconds.
 	A read-write single value file which exists on non-root
 	cgroups.  The default is "100".
 
-	The weight in the range [1, 10000].
+	For non idle groups (cpu.idle = 0), the weight is in the
+	range [1, 10000].
+
+	If the cgroup has been configured to be SCHED_IDLE (cpu.idle = 1),
+	then the weight will show as a 0.
 
   cpu.weight.nice
 	A read-write single value file which exists on non-root
@@ -1157,6 +1161,16 @@ All time durations are in microseconds.
         values similar to the sched_setattr(2). This maximum utilization
         value is used to clamp the task specific maximum utilization clamp.
 
+  cpu.idle
+	A read-write single value file which exists on non-root cgroups.
+	The default is 0.
+
+	This is the cgroup analog of the per-task SCHED_IDLE sched policy.
+	Setting this value to a 1 will make the scheduling policy of the
+	cgroup SCHED_IDLE. The threads inside the cgroup will retain their
+	own relative priorities, but the cgroup itself will be treated as
+	very low priority relative to its peers.
+
 
 
 Memory
-- 
2.43.0.rc2.451.g8631bc7472-goog


