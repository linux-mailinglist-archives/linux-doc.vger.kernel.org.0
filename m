Return-Path: <linux-doc+bounces-990-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 039827D552B
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 17:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C117B20FA0
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 15:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529CD30FA5;
	Tue, 24 Oct 2023 15:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="OcG714uU"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FF030F80;
	Tue, 24 Oct 2023 15:16:52 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B34DA1987;
	Tue, 24 Oct 2023 08:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rpX32JELJVRxbBajbNmSR45zpZhhmbYGw/k55Nv6FvI=; b=OcG714uUqwrZhegBX5wQQ0eRZX
	mZUreD2oXOfdv58j1eBrER0DefsWk5764QnZgFsI722cxEePKW7jkBCM62asx2pXYkyBbFLoeQdcv
	HU7WpXuh5BgCkmzLW9oG9918CV5/RqoRE8Y7OK1eGEvXAK9eQzrkAZnv+CSbxNAZ/k03enXtA46lE
	PppwrqqFP4bW1TPrA4jyamGrzPHOv4VFTfSDBsKxN3liZkF1YbT0EdrcqH1x5RrN+S6/YBZU/ddmX
	YeR5z03WpEjgjvnRKCyrvoGv6/iyIvTf3XeK7GNTywbwqm4ntZOaauwEkPtIrFcYp2ezvoACcBkWf
	yESvnrFA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35410 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1qvJ94-0004MU-2I;
	Tue, 24 Oct 2023 16:16:38 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1qvJ96-00AqPM-5D; Tue, 24 Oct 2023 16:16:40 +0100
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH 06/39] drivers: base: Use present CPUs in GENERIC_CPU_DEVICES
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1qvJ96-00AqPM-5D@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 24 Oct 2023 16:16:40 +0100

From: James Morse <james.morse@arm.com>

Three of the five ACPI architectures create sysfs entries using
register_cpu() for present CPUs, whereas arm64, riscv and all
GENERIC_CPU_DEVICES do this for possible CPUs.

Registering a CPU is what causes them to show up in sysfs.

It makes very little sense to register all possible CPUs. Registering
a CPU is what triggers the udev notifications allowing user-space to
react to newly added CPUs.

To allow all five ACPI architectures to use GENERIC_CPU_DEVICES, change
it to use for_each_present_cpu(). Making the ACPI architectures use
GENERIC_CPU_DEVICES is a pre-requisite step to centralise their
cpu_register() logic, before moving it into the ACPI processor driver.
When ACPI is disabled this work would be done by
cpu_dev_register_generic().

Of the ACPI architectures that register possible CPUs, arm64 and riscv
do not support making possible CPUs present as they use the weak 'always
fails' version of arch_register_cpu().

Only two of the eight architectures that use GENERIC_CPU_DEVICES have a
distinction between present and possible CPUs.

The following architectures use GENERIC_CPU_DEVICES but are not SMP,
so possible == present:
 * m68k
 * microblaze
 * nios2

The following architectures use GENERIC_CPU_DEVICES and consider
possible == present:
 * csky: setup_smp()
 * processor_probe() sets possible for all CPUs and present for all CPUs
   except the boot cpu, which will have been done by
   init/main.c::start_kernel().

um appears to be a subarchitecture of x86.

The remaining architecture using GENERIC_CPU_DEVICES are:
 * openrisc and hexagon:
   where smp_init_cpus() makes all CPUs < NR_CPUS possible,
   whereas smp_prepare_cpus() only makes CPUs < setup_max_cpus present.

After this change, openrisc and hexagon systems that use the max_cpus
command line argument would not see the other CPUs present in sysfs.
This should not be a problem as these CPUs can't bre brought online as
_cpu_up() checks cpu_present().

After this change, only CPUs which are present appear in sysfs.

Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/base/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index 9ea22e165acd..34b48f660b6b 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -533,7 +533,7 @@ static void __init cpu_dev_register_generic(void)
 #ifdef CONFIG_GENERIC_CPU_DEVICES
 	int i;
 
-	for_each_possible_cpu(i) {
+	for_each_present_cpu(i) {
 		if (register_cpu(&per_cpu(cpu_devices, i), i))
 			panic("Failed to register CPU device");
 	}
-- 
2.30.2


