Return-Path: <linux-doc+bounces-56254-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AB154B26FAE
	for <lists+linux-doc@lfdr.de>; Thu, 14 Aug 2025 21:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 898A07B0F01
	for <lists+linux-doc@lfdr.de>; Thu, 14 Aug 2025 19:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4741CDFAC;
	Thu, 14 Aug 2025 19:30:49 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C94CA31986F;
	Thu, 14 Aug 2025 19:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755199849; cv=none; b=cWrOOnZhHOdIta7RfsonXXHZFlHEiyfOub3KtoeKib89drBZZkiBT6zxeCeSbtOuMWf5g90g6SKSPF9VYwpT1OPtQ/pdqAkm0FV/T1mcx3b/2sLTKOmzQ9OOAzzN/T0GmuEw4sDufOGZcT/eHcWCg2q1HiJW/zRsLEE8pfksDoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755199849; c=relaxed/simple;
	bh=DhhM8Zn5/pQg6diUjBBdUDnZEhmpufToEhf+iKMdsYk=;
	h=From:To:Cc:Subject:Date:Message-Id; b=LDLvoV+F+aZUf+dEh0VQN2ZeFuZTHjBLnPUKVGd6Y1Oyb5JdmsjMyOYj08DEKQjABpYMed7KOpIWmzO/FR6ETAhxTEDJlsQvWh6or95PXkbEQNA/u9Fl4uzxyCZvhIF0hR2fxw2tOfqk9bz3yjeOvrmm16P0M03NxNMHdGxBWjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 57EJRmDH019294;
	Thu, 14 Aug 2025 21:27:48 +0200
From: Willy Tarreau <w@1wt.eu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: security@kernel.org, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 1/2] Documentation: clarify the expected collaboration with security bugs reporters
Date: Thu, 14 Aug 2025 21:27:29 +0200
Message-Id: <20250814192730.19252-1-w@1wt.eu>
X-Mailer: git-send-email 2.17.5
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

Some bug reports sent to the security team sometimes lack any explanation,
are only AI-generated without verification, or sometimes it can simply be
difficult to have a conversation with an invisible reporter belonging to
an opaque team. This fortunately remains rare but the trend has been
steadily increasing over the last years and it seems important to clarify
what developers expect from reporters to avoid frustration on any side and
keep the process efficient.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 Documentation/process/security-bugs.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
index 56c560a00b37a..7dcc034d3df8e 100644
--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -19,6 +19,16 @@ that can speed up the process considerably.  It is possible that the
 security team will bring in extra help from area maintainers to
 understand and fix the security vulnerability.
 
+The security team and maintainers almost always require additional
+information beyond what was initially provided in a report and rely on
+active and efficient collaboration with the reporter to perform further
+testing (e.g., verifying versions, configuration options, mitigations, or
+patches). Before contacting the security team, the reporter must ensure
+they are available to explain their findings, engage in discussions, and
+run additional tests.  Reports where the reporter does not respond promptly
+or cannot effectively discuss their findings may be abandoned if the
+communication does not quickly improve.
+
 As it is with any bug, the more information provided the easier it
 will be to diagnose and fix.  Please review the procedure outlined in
 'Documentation/admin-guide/reporting-issues.rst' if you are unclear about what
-- 
2.17.5


