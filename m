Return-Path: <linux-doc+bounces-4884-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F8880FBF1
	for <lists+linux-doc@lfdr.de>; Wed, 13 Dec 2023 01:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BDF6282319
	for <lists+linux-doc@lfdr.de>; Wed, 13 Dec 2023 00:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6BD438D;
	Wed, 13 Dec 2023 00:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="a1vPSAn4"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-fw-52005.amazon.com (smtp-fw-52005.amazon.com [52.119.213.156])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70463D4D;
	Tue, 12 Dec 2023 16:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1702426083; x=1733962083;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8E5gYeBn7LzFXeE9t3+WWJhfPWwonViYFj973oiYUIk=;
  b=a1vPSAn4RN5MYIpsd3DyyRCkJuBHnCOBZooVN6/fJapR6P9VnnkYiZDS
   1vd8AU/P7+v6f0O8Dzt4xCJuMNWr6H27HNgYhSjG9x5NzAiItEAdByflx
   5JxfSMdqz0mSchn+8natHOk8lS7fixALyrIXy89rim6IuNE5YAMbj/jnk
   0=;
X-IronPort-AV: E=Sophos;i="6.04,271,1695686400"; 
   d="scan'208";a="621371857"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-iad-1a-m6i4x-bbc6e425.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-52005.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 00:08:01 +0000
Received: from smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev (iad7-ws-svc-p70-lb3-vlan3.iad.amazon.com [10.32.235.38])
	by email-inbound-relay-iad-1a-m6i4x-bbc6e425.us-east-1.amazon.com (Postfix) with ESMTPS id EF61380632;
	Wed, 13 Dec 2023 00:07:52 +0000 (UTC)
Received: from EX19MTAUWB001.ant.amazon.com [10.0.21.151:16104]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.43.236:2525] with esmtp (Farcaster)
 id 3bda4ab2-5ec6-4d32-90c9-2880fbf14c72; Wed, 13 Dec 2023 00:07:51 +0000 (UTC)
X-Farcaster-Flow-ID: 3bda4ab2-5ec6-4d32-90c9-2880fbf14c72
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 13 Dec 2023 00:07:44 +0000
Received: from dev-dsk-graf-1a-5ce218e4.eu-west-1.amazon.com (10.253.83.51) by
 EX19D020UWC004.ant.amazon.com (10.13.138.149) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 13 Dec 2023 00:07:40 +0000
From: Alexander Graf <graf@amazon.com>
To: <linux-kernel@vger.kernel.org>
CC: <linux-trace-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kexec@lists.infradead.org>, <linux-doc@vger.kernel.org>, <x86@kernel.org>,
	Eric Biederman <ebiederm@xmission.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	"Rob Herring" <robh+dt@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	"Andrew Morton" <akpm@linux-foundation.org>, Mark Rutland
	<mark.rutland@arm.com>, "Tom Lendacky" <thomas.lendacky@amd.com>, Ashish
 Kalra <ashish.kalra@amd.com>, James Gowans <jgowans@amazon.com>, Stanislav
 Kinsburskii <skinsburskii@linux.microsoft.com>, <arnd@arndb.de>,
	<pbonzini@redhat.com>, <madvenka@linux.microsoft.com>, Anthony Yznaga
	<anthony.yznaga@oracle.com>, Usama Arif <usama.arif@bytedance.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>
Subject: [PATCH 15/15] tracing: Add config option for kexec handover
Date: Wed, 13 Dec 2023 00:04:52 +0000
Message-ID: <20231213000452.88295-16-graf@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231213000452.88295-1-graf@amazon.com>
References: <20231213000452.88295-1-graf@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: EX19D033UWA001.ant.amazon.com (10.13.139.103) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now that all bits are in place to allow ftrace to pass its trace data
into the next kernel on kexec, let's give users a kconfig option to
enable the functionality.

Signed-off-by: Alexander Graf <graf@amazon.com>
---
 kernel/trace/Kconfig | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 61c541c36596..af83ee755b9e 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -1169,6 +1169,19 @@ config HIST_TRIGGERS_DEBUG
 
           If unsure, say N.
 
+config FTRACE_KHO
+	bool "Ftrace Kexec handover support"
+	depends on KEXEC_KHO
+	help
+          Enable support for ftrace to pass metadata across kexec so the new
+	  kernel continues to use the previous kernel's trace buffers.
+
+	  This can be useful when debugging kexec performance or correctness
+	  issues: The new kernel can dump the old kernel's trace buffer which
+	  contains all events until reboot.
+
+	  If unsure, say N.
+
 source "kernel/trace/rv/Kconfig"
 
 endif # FTRACE
-- 
2.40.1




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




