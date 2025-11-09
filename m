Return-Path: <linux-doc+bounces-65956-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0964DC4374D
	for <lists+linux-doc@lfdr.de>; Sun, 09 Nov 2025 03:34:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4B90188CB66
	for <lists+linux-doc@lfdr.de>; Sun,  9 Nov 2025 02:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24CFE150997;
	Sun,  9 Nov 2025 02:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Ec2w0w97"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9968013B58C
	for <linux-doc@vger.kernel.org>; Sun,  9 Nov 2025 02:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762655678; cv=none; b=mDbnbrWnPcK7zNs/LwKbp6GgSfkWrUTS8+Owbz3/nbtWCwN6EBZ0n8kZbUN5Uj0YbNDb4hyimoC+twGNlYNlOmWkJ6ukngSROdk2+E8vdn9ir2D2DaA3q7JivKbw17D58tMeqUd3xdY+wj9z7UTDpg2vbq+IpZd+2aJ4Tev3Jco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762655678; c=relaxed/simple;
	bh=NEGZUeoc1I7/yURwfguNi+vKBoYyzsfFjZmHFoz3HnM=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ucD/8Sy5NZ+dL2Hx0HPnLQ75R7ZhfeSU8jShO8g/4pBWvo2NRx8lp36217Vf2foIn1gilihS8xbwFXO/LjmVhOwyywVXcRI9Ss2To5kumZTbnR+TfoiTJUlP40Xsm5TtwJKXdt5OEefTh6IsIsc53VHGAE0Q6OvdzDfymNqDW+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=Ec2w0w97; arc=none smtp.client-ip=185.70.43.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1762655667; x=1762914867;
	bh=m1ynGI2X+AbLJ9LU40R+pHG9Sqnj+G39AWPu5pNlDyA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Ec2w0w97K7XigU6rK+7r/Bc2V/vckhVtkeIQorwIMJJaGy74l/zxfR8o3I4zmDXT6
	 YZwKmczz116R6acHAN+OVeiDxkpNzrdqYsfJIajLmW345v8SQEdVqf/Q5Xvh8gLXTY
	 FFIeF2qDORmkoHoGvaJdwLPHjUpuOKiHQqKJfL8Dt+Qzj5bFh2fr0ib1sFNNRSKdag
	 +jjKzAysgYtoKZ4etDkIfTO06aUdQ/cxK4hQsHuQWZp7TNEX8tYXsQRL0irt7ooRG5
	 PqAyjs38jJjg9IoLa6Ti0FY1844Cm3h6bjp3MdGzuunvn7FsfYBO7OkHIIX1fnHdfD
	 oha1W0JM2PmWw==
Date: Sun, 09 Nov 2025 02:34:21 +0000
To: "tglx@linutronix.de" <tglx@linutronix.de>
From: pierwill <pierwill@protonmail.com>
Cc: "bp@alien8.de" <bp@alien8.de>, "peterz@infradead.org" <peterz@infradead.org>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>, "pawan.kumar.gupta@linux.intel.com" <pawan.kumar.gupta@linux.intel.com>, "corbet@lwn.net" <corbet@lwn.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] docs: Fix missing word in spectre.rst
Message-ID: <Ru-d3ltJIyY4Oc6tzHwpSiDeFwSLHEzd7Utcr6iobgIy1B8wLRI4f6JiCb0a9n-0-r19d0dyLL3yS8KWVcyHfpkyDErWXYTkI3AJfUPTNCc=@protonmail.com>
Feedback-ID: 8154370:user:proton
X-Pm-Message-ID: 5db94a92c7c942c594a7393287e0d7cbd0ec549b
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Corrects a missing word in the hardware vulnerability docs.

Signed-off-by: Will Pierce <pierwill@protonmail.com>
---
 Documentation/admin-guide/hw-vuln/spectre.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/hw-vuln/spectre.rst b/Documentation/=
admin-guide/hw-vuln/spectre.rst
index 991f12adef8d..4bb8549bee82 100644
--- a/Documentation/admin-guide/hw-vuln/spectre.rst
+++ b/Documentation/admin-guide/hw-vuln/spectre.rst
@@ -406,7 +406,7 @@ The possible values in this file are:

   - Single threaded indirect branch prediction (STIBP) status for protecti=
on
     between different hyper threads. This feature can be controlled throug=
h
-    prctl per process, or through kernel command line options. This is x86
+    prctl per process, or through kernel command line options. This is an =
x86
     only feature. For more details see below.

   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
--
2.39.5 (Apple Git-154)

