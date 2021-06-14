Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D32D83A6857
	for <lists+linux-doc@lfdr.de>; Mon, 14 Jun 2021 15:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233608AbhFNNuu (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 14 Jun 2021 09:50:50 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:12008 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233389AbhFNNut (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Jun 2021 09:50:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1623678527; x=1655214527;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Xe3rezfzr9LX/jywWeYNOUETwkRGBANMSmd+MqWC3zU=;
  b=i3Fkc2MRYa989avXeuJm5hPq4zDjbctpzBqyVavrICQ5P8kGl34VsR87
   nVGYq9juQZ4t5V5qSxxdwLyYUnYf5Zy7dpOQ6ON5DKpL/Ipx/tsauUAbF
   pVgfAp4m5fxU26K5xXtNTG5pLiEZDMIvTlgivqBMNQ3hoETAmMAY45U85
   A=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 14 Jun 2021 06:48:46 -0700
X-QCInternal: smtphost
Received: from nalasexr03e.na.qualcomm.com ([10.49.195.114])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Jun 2021 06:48:45 -0700
Received: from [10.38.245.104] (10.80.80.8) by nalasexr03e.na.qualcomm.com
 (10.49.195.114) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 14 Jun
 2021 06:48:43 -0700
Subject: Re: [PATCH 0/5] cpufreq: cppc: Fix suspend/resume specific races with
 FIE code
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Rafael Wysocki <rjw@rjwysocki.net>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
CC:     <linux-pm@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Ionela Voinescu <ionela.voinescu@arm.com>,
        Dirk Brandewie <dirk.j.brandewie@intel.com>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>
References: <cover.1623313323.git.viresh.kumar@linaro.org>
From:   Qian Cai <quic_qiancai@quicinc.com>
Message-ID: <eaaaf171-5937-e0f2-8447-c1b20b474c62@quicinc.com>
Date:   Mon, 14 Jun 2021 09:48:41 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cover.1623313323.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03e.na.qualcomm.com (10.85.0.48) To
 nalasexr03e.na.qualcomm.com (10.49.195.114)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 6/10/2021 4:23 AM, Viresh Kumar wrote:
> Hi Qian,
> 
> It would be helpful if you can test this patchset and confirm if the races you
> mentioned went away or not and that the FIE code works as we wanted it to.
> 
> I don't have a real setup and so it won't be easy for me to test this out.
> 
> I have already sent a temporary fix for 5.13 and this patchset is targeted for
> 5.14 and is based over that.

Unfortunately, this series looks like needing more works.

[  487.773586][    T0] CPU17: Booted secondary processor 0x0000000801 [0x503f0002]
[  487.976495][  T670] list_del corruption. next->prev should be ffff009b66e9ec70, but was ffff009b66dfec70
[  487.987037][  T670] ------------[ cut here ]------------
[  487.992351][  T670] kernel BUG at lib/list_debug.c:54!
[  487.997810][  T670] Internal error: Oops - BUG: 0 [#1] SMP
[  488.003295][  T670] Modules linked in: cpufreq_userspace xfs loop cppc_cpufreq processor efivarfs ip_tables x_tables ext4 mbcache jbd2 dm_mod igb i2c_algo_bit nvme mlx5_core i2c_core nvme_core firmware_class
[  488.021759][  T670] CPU: 1 PID: 670 Comm: cppc_fie Not tainted 5.13.0-rc5-next-20210611+ #46
[  488.030190][  T670] Hardware name: MiTAC RAPTOR EV-883832-X3-0001/RAPTOR, BIOS 1.6 06/28/2020
[  488.038705][  T670] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO BTYPE=--)
[  488.045398][  T670] pc : __list_del_entry_valid+0x154/0x158
[  488.050969][  T670] lr : __list_del_entry_valid+0x154/0x158
[  488.056534][  T670] sp : ffff8000229afd70
[  488.060534][  T670] x29: ffff8000229afd70 x28: ffff0008c8f4f340 x27: dfff800000000000
[  488.068361][  T670] x26: ffff009b66e9ec70 x25: ffff800011c8b4d0 x24: ffff0008d4bfe488
[  488.076188][  T670] x23: ffff0008c8f4f340 x22: ffff0008c8f4f340 x21: ffff009b6789ec70
[  488.084015][  T670] x20: ffff0008d4bfe4c8 x19: ffff009b66e9ec70 x18: ffff0008c8f4fd70
[  488.091842][  T670] x17: 20747562202c3037 x16: 6365396536366239 x15: 0000000000000028
[  488.099669][  T670] x14: 0000000000000000 x13: 0000000000000001 x12: ffff60136cdd3447
[  488.107495][  T670] x11: 1fffe0136cdd3446 x10: ffff60136cdd3446 x9 : ffff8000103ee444
[  488.115322][  T670] x8 : ffff009b66e9a237 x7 : 0000000000000001 x6 : ffff009b66e9a230
[  488.123149][  T670] x5 : 00009fec9322cbba x4 : ffff60136cdd3447 x3 : 1fffe001191e9e69
[  488.130975][  T670] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000054
[  488.138803][  T670] Call trace:
[  488.141935][  T670]  __list_del_entry_valid+0x154/0x158
[  488.147153][  T670]  kthread_worker_fn+0x15c/0xda0
[  488.151939][  T670]  kthread+0x3ac/0x460
[  488.155854][  T670]  ret_from_fork+0x10/0x18
[  488.160120][  T670] Code: 911e8000 aa1303e1 910a0000 941b595b (d4210000)
[  488.166901][  T670] ---[ end trace e637e2d38b2cc087 ]---
[  488.172206][  T670] Kernel panic - not syncing: Oops - BUG: Fatal exception
[  488.179182][  T670] SMP: stopping secondary CPUs
[  489.209347][  T670] SMP: failed to stop secondary CPUs 0-1,10-11,16-17,31
[  489.216128][  T][  T670] Memoryn ]---

> 
> -------------------------8<-------------------------
> 
> The CPPC driver currently stops the frequency invariance related
> kthread_work and irq_work from cppc_freq_invariance_exit() which is only
> called during driver's removal.
> 
> This is not sufficient as the CPUs can get hot-plugged out while the
> driver is in use, the same also happens during system suspend/resume.
> 
> In such a cases we can reach a state where the CPU is removed by the
> kernel but its kthread_work or irq_work aren't stopped.
> 
> Fix this by implementing the start_cpu() and stop_cpu() callbacks in the
> cpufreq core, which will be called for each CPU's addition/removal.
> 
> A similar call was already available in the cpufreq core, which isn't required
> anymore and so its users are migrated to use exit() callback instead.
> 
> This is targeted for v5.14-rc1.
> 
> --
> Viresh
> 
> Viresh Kumar (5):
>   cpufreq: cppc: Migrate to ->exit() callback instead of ->stop_cpu()
>   cpufreq: intel_pstate: Migrate to ->exit() callback instead of
>     ->stop_cpu()
>   cpufreq: powerenv: Migrate to ->exit() callback instead of
>     ->stop_cpu()
>   cpufreq: Add start_cpu() and stop_cpu() callbacks
>   cpufreq: cppc: Fix suspend/resume specific races with the FIE code
> 
>  Documentation/cpu-freq/cpu-drivers.rst |   7 +-
>  drivers/cpufreq/Kconfig.arm            |   1 -
>  drivers/cpufreq/cppc_cpufreq.c         | 163 ++++++++++++++-----------
>  drivers/cpufreq/cpufreq.c              |  11 +-
>  drivers/cpufreq/intel_pstate.c         |   9 +-
>  drivers/cpufreq/powernv-cpufreq.c      |  23 ++--
>  include/linux/cpufreq.h                |   5 +-
>  7 files changed, 119 insertions(+), 100 deletions(-)
> 
