Return-Path: <linux-doc+bounces-1002-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 107147D5552
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 17:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDFA4281B49
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 15:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A03DF347C4;
	Tue, 24 Oct 2023 15:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="BaRzQs9R"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CA431A89;
	Tue, 24 Oct 2023 15:17:41 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AB5C19A5;
	Tue, 24 Oct 2023 08:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XGhpKk09pdERl3TLuSkcjp8wddtxgCnM/F8wNa+d4Ds=; b=BaRzQs9RvF3vLCxNwFRxtjE6ks
	wG2NaWwkOXyUT2VHE/A3pWr8BxpYPLcrVCvY7kZ8127m2eL2srXo4sXT7vfm30D5MBa/Bw1gIh1hD
	v9aK0QW1Gfhj89CyI+h0062CIXcrogZdeY5hrauhc8Ep5dLRrMsSDBLjZwqa9uOI00kgtTDaXWyJ/
	Cs/eEoRzj/niuEj9vq34jJwjfsrdLFMkKMbHbKWilyR5CO6KkvKlUabW/kgmZff9YrW8EeJJWVAMX
	HxcW7NNOFovYMbqcpXDvqlfORQ00w00zpq6D/oEnhIchOBNNPRAw5GSIm3ujZTIICK23YJBZ3lrLZ
	pW687WYA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33446 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1qvJ9z-0004Ql-0y;
	Tue, 24 Oct 2023 16:17:35 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1qvJA0-00AqQU-Or; Tue, 24 Oct 2023 16:17:36 +0100
In-Reply-To: <ZTffkAdOqL2pI2la@shell.armlinux.org.uk>
References: <ZTffkAdOqL2pI2la@shell.armlinux.org.uk>
From: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To: linux-pm@vger.kernel.org,
	 loongarch@lists.linux.dev,
	 linux-acpi@vger.kernel.org,
	 linux-arch@vger.kernel.org,
	 linux-kernel@vger.kernel.org,
	 linux-arm-kernel@lists.infradead.org,
	 linux-riscv@lists.infradead.org,
	 kvmarm@lists.linux.dev,
	 x86@kernel.org,
	 linux-csky@vger.kernel.org,
	 linux-doc@vger.kernel.org,
	 linux-ia64@vger.kernel.org,
	 linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
	 Jean-Philippe Brucker <jean-philippe@linaro.org>,
	 jianyong.wu@arm.com,
	 justin.he@arm.com,
	 James Morse <james.morse@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH 17/39] arch_topology: Make register_cpu_capacity_sysctl()
 tolerant to late CPUs
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1qvJA0-00AqQU-Or@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 24 Oct 2023 16:17:36 +0100

From: James Morse <james.morse@arm.com>

register_cpu_capacity_sysctl() adds a property to sysfs that describes
the CPUs capacity. This is done from a subsys_initcall() that assumes
all possible CPUs are registered.

With CPU hotplug, possible CPUs aren't registered until they become
present, (or for arm64 enabled). This leads to messages during boot:
| register_cpu_capacity_sysctl: too early to get CPU1 device!
and once these CPUs are added to the system, the file is missing.

Move this to a cpuhp callback, so that the file is created once
CPUs are brought online. This covers CPUs that are added late by
mechanisms like hotplug.
One observable difference is the file is now missing for offline CPUs.

Signed-off-by: James Morse <james.morse@arm.com>
---
If the offline CPUs thing is a problem for the tools that consume
this value, we'd need to move cpu_capacity to be part of cpu.c's
common_cpu_attr_groups.
---
 drivers/base/arch_topology.c | 38 ++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index b741b5ba82bd..9ccb7daee78e 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -220,20 +220,34 @@ static DECLARE_WORK(update_topology_flags_work, update_topology_flags_workfn);
 
 static DEVICE_ATTR_RO(cpu_capacity);
 
-static int register_cpu_capacity_sysctl(void)
+static int cpu_capacity_sysctl_add(unsigned int cpu)
 {
-	int i;
-	struct device *cpu;
+	struct device *cpu_dev = get_cpu_device(cpu);
 
-	for_each_possible_cpu(i) {
-		cpu = get_cpu_device(i);
-		if (!cpu) {
-			pr_err("%s: too early to get CPU%d device!\n",
-			       __func__, i);
-			continue;
-		}
-		device_create_file(cpu, &dev_attr_cpu_capacity);
-	}
+	if (!cpu_dev)
+		return -ENOENT;
+
+	device_create_file(cpu_dev, &dev_attr_cpu_capacity);
+
+	return 0;
+}
+
+static int cpu_capacity_sysctl_remove(unsigned int cpu)
+{
+	struct device *cpu_dev = get_cpu_device(cpu);
+
+	if (!cpu_dev)
+		return -ENOENT;
+
+	device_remove_file(cpu_dev, &dev_attr_cpu_capacity);
+
+	return 0;
+}
+
+static int register_cpu_capacity_sysctl(void)
+{
+	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "topology/cpu-capacity",
+			  cpu_capacity_sysctl_add, cpu_capacity_sysctl_remove);
 
 	return 0;
 }
-- 
2.30.2


