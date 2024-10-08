Return-Path: <linux-doc+bounces-26779-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDCF9950BC
	for <lists+linux-doc@lfdr.de>; Tue,  8 Oct 2024 15:54:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 090361F21127
	for <lists+linux-doc@lfdr.de>; Tue,  8 Oct 2024 13:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6FF1DFD8F;
	Tue,  8 Oct 2024 13:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="jV6wqAvy"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE77626ADD
	for <linux-doc@vger.kernel.org>; Tue,  8 Oct 2024 13:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728395630; cv=none; b=mad/4Ei1QdYfo0Vt8QhtJ+8gaMHUlR8qNraVbNUberzQSH4LnfWIAhq6HAZmqbevDAcv+CWltUM2ZfNaDPKkKQCZwQS5lfdzbrq9l3diGWEjoEVl/W/T0YEC2hUXBj439ZXdLQb5ltQYmFto9nImDKwqiLAKoe9MagwX9dPVAUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728395630; c=relaxed/simple;
	bh=VyRvpnQ3XBxkjfPAZbExFDOfmuIPnnj3g+LyGrP/bnk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kwHOkqLgqgos6KE3sJi47rpMZfDQKG80ps9y1BJUMYV/xrIL3BZFqY58PtTQgZtUllEzbEQzwUusSvqj+4GgL9uuuAHVBhB2QJE6mmkR7WN6sptFwM/6VGJcjME+vGcD8BQw86U/dBs7BHUyDEUJmq7V658xzwvOTD5Dfc1qnZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=jV6wqAvy; arc=none smtp.client-ip=62.149.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Received: from polimar.homenet.telecomitalia.it ([79.0.204.227])
	by Aruba Outgoing Smtp  with ESMTPSA
	id yAbisgixkbsngyAblsUWWf; Tue, 08 Oct 2024 15:50:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1728395437; bh=VyRvpnQ3XBxkjfPAZbExFDOfmuIPnnj3g+LyGrP/bnk=;
	h=From:To:Subject:Date:MIME-Version;
	b=jV6wqAvyLsgEW+vzvJ2ntqZFPDEYpNZTn8rnElfOAr/gWD18sx6HyBMzgHYuSgNAM
	 Ckq4ig9BmT44Hgg039Mx/D/47zFKfxtvPe6+9DgB7ycqqvXYs5L8Z9Fv3gzAHE51OY
	 sunm92uPdegqsb98zDtA5n5LxZMa6KxYmHRqAERJmd/f3q8iX43W/FrdJKzxyxTJYi
	 Z8e2/wBLb3zG4uUFyYOcdGpq9usd2nVE/95GXYW+giZv3RJVVYzt2pSfq57XwuGCH1
	 J6SQEHlsrU38q/7rTTiWHVo+A87GgRUljn97GME13MMaqCy7N8FxF+3Ds+ALoTkbYd
	 P96lxjM+y68Nw==
From: Rodolfo Giometti <giometti@enneenne.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Greg KH <greg@kroah.com>,
	corbet@lwn.net,
	Hall Christopher S <christopher.s.hall@intel.com>,
	Mohan Subramanian <subramanian.mohan@intel.com>,
	tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com,
	Dong Eddie <eddie.dong@intel.com>,
	N Pandith <pandith.n@intel.com>,
	T R Thejesh Reddy <thejesh.reddy.t.r@intel.com>,
	Zage David <david.zage@intel.com>,
	Chinnadurai Srinivasan <srinivasan.chinnadurai@intel.com>,
	Rodolfo Giometti <giometti@enneenne.com>
Subject: [RFC 3/3] Documentation ABI: add PPS generators documentaion
Date: Tue,  8 Oct 2024 15:50:33 +0200
Message-Id: <20241008135033.3171915-4-giometti@enneenne.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008135033.3171915-1-giometti@enneenne.com>
References: <20241008135033.3171915-1-giometti@enneenne.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfP5U7jx3B81F686kX4T4Oiv6i3eEj04luOg7Go0TsFKHNeWefdCGahxXs0bq0y6bSAWVQDwGt9M/FTkV8o0S1xmz+8C29+HJ5eAN3J/Ool1mKM2VW8eo
 M5v9h8m/zApegAdfFXMXCQoErVNyLTD6QuIPWpVAZ5TVr9HDfQDl14EhVYkTex8FD5vPRyANzCfMkR+Hid6RaO4OiwyxnJhqSheZ7737DcNo2lCOc04sdCfs
 ponx0u1zOFt3ED3zu/pUY/su66i/8mgox0dmQsvNIdoLeWG7gcSmc1ZDftYSDHyX+tyJ8MrAsB+eG+8odaRF6XS+QQSB4Qofhf8x0JMjNrgaf+ITOwG5rdFR
 xdrjJRCXnwNoVb1wqpmYqh7nVToNYOfgy4+ofLtTqf0Id6aUTHlWd9rJ/SRMcRcHSDODw/4CB5nQArEsFPYvJQixTgCtvTN2Q9eibw/ASbxuYcrDgQnig4V/
 AJx8Aqz1YeiwWNuDcgtq0hqFo9VRWqgNIk2KQ9csg8qz39TXnsN0jIKdhp2vZPgoLvejAY5mIpoig8jaXSu3lLzBSyhnpNME4o0UDBXXcBP8o/0FcDW7Zttg
 3iSYkdSRTrJRkUMqGjAcMmdBwZ1Ezrnnl1/ZMsvl6KZbl1LKbad8ks5enQqbx7hi6tlu1Oa2BUMunO24F/K7aOIMb2h+yO1mSNZyK6OBnreG40wgs0HYejzM
 vxN2uIEVsCt3MjVbyQpyXMXvHcR6tM8i

This patch adds the documentation for the ABI between the Linux kernel
and userspace regarding the PPS generators.

Signed-off-by: Rodolfo Giometti <giometti@enneenne.com>
---
 Documentation/ABI/testing/sysfs-pps-gen | 44 +++++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-pps-gen

diff --git a/Documentation/ABI/testing/sysfs-pps-gen b/Documentation/ABI/testing/sysfs-pps-gen
new file mode 100644
index 000000000000..9ad066cb3ce5
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-pps-gen
@@ -0,0 +1,44 @@
+What:		/sys/class/pps-gen/
+Date:		October 2024
+Contact:	Rodolfo Giometti <giometti@enneenne.com>
+Description:
+		The /sys/class/pps-gen/ directory will contain files and
+		directories that will provide a unified interface to
+		the PPS generators.
+
+What:		/sys/class/pps-gen/pps-genX/
+Date:		October 2024
+Contact:	Rodolfo Giometti <giometti@enneenne.com>
+Description:
+		The /sys/class/pps-gen/pps-genX/ directory is related to X-th
+		PPS generator into the system. Each directory will
+		contain files to manage and control its PPS generator.
+
+What:		/sys/class/pps-gen/pps-genX/enable
+Date:		October 2024
+Contact:	Rodolfo Giometti <giometti@enneenne.com>
+Description:
+		This write-only file enables or disables generation of the
+		PPS signal.
+
+What:		/sys/class/pps-gen/pps-genX/name
+Date:		October 2024
+Contact:	Rodolfo Giometti <giometti@enneenne.com>
+Description:
+		This read-only file reports the name of the X-th generator.
+
+What:		/sys/class/pps-gen/pps-genX/system
+Date:		October 2024
+Contact:	Rodolfo Giometti <giometti@enneenne.com>
+Description:
+		This read-only file returns "1" if the generator takes the
+		timing from the system clock, while it returns "0" if not
+		(i.e. from a peripheral device clock).
+
+What:		/sys/class/pps-gen/pps-genX/time
+Date:		October 2024
+Contact:	Rodolfo Giometti <giometti@enneenne.com>
+Description:
+		This read-only file contains the current time stored into the
+		generator clock as two integers representing the current time
+		seconds and nanoseconds. 
-- 
2.34.1


