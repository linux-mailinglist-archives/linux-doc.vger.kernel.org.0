Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5875800CB
	for <lists+linux-doc@lfdr.de>; Mon, 25 Jul 2022 16:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235609AbiGYOdH (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 25 Jul 2022 10:33:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235590AbiGYOdC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jul 2022 10:33:02 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2D7717AA1
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 07:33:00 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-31f41584236so3489837b3.5
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 07:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=co9T2j4fIM1ZH3gXxAHTI60xfHFgHbaMpFRuKb9I9mA=;
        b=LiHjSSpfGMiVTnmOFY9QDuMQykTrxxXoASPsoaO5EV/5dKssAFUpuTGFe00f2SSjlN
         FOAW0BvfJH9OaIKi6uM4OtBwaiBHLECXKHkZx9Mcx2TTQ3cbCdJjxiKKfScEaYk1gJbD
         K0sQ8A9k9KEnGVfXaCGPsugcWwLxkvMnPyGYH6gT3oZ34m5oZU4s5SHfmBnGjiZx0/k/
         35QMlOjRK3tMlQ57OVC7eaAxkXZQECOcOy0VOLMWVw+jVfhzDa9TkqIpCPRwCNhs83IQ
         s64QtI+WTk5RkVEos1i/OK/Qf/F2N/p9Lz9YmUujR1ZBuZx2HpvouVX1RW78Jrdvof7S
         Hplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=co9T2j4fIM1ZH3gXxAHTI60xfHFgHbaMpFRuKb9I9mA=;
        b=xXsOcvqiJoSF4wAIslz+dLsIBkaInLsPMfbyIAUPdcB5unWOZRUAPGSM0rZm3uZ0zJ
         wjZh8FYC+T11iFKVpeuNa3S9/NZ+CGMLHNdIku9ZTUSTqdWTziaj0rW48HRhlb/v1uEp
         GE9DpYTmyG1hjfU9MwCmVRklPcOMHYVUjjfNPy3lt3VKXCEacSqtNg/Ya2zd1JLF4ZXV
         knHJWyK3GAq135SFVojKxzET4viu4k0Q3h3wjCf3YMjXxHiHm/E5ll9Oe7FfMZOA9MiE
         kR2tv0mL/hQuvGkp8gR4emgJHgtF3HG83OW1xpoj3y5tWbuCaOvSDxyutG2/LUIvb3fg
         1jUw==
X-Gm-Message-State: AJIora+AzjbcsPqY5XgRybWmmwc0I7r9VIOb1WDzyjefrpvbPWDi8sPM
        W9R6Hi9HEnO4Qqy2TwuydtlKG/41+OX7scbihLsrfQ==
X-Google-Smtp-Source: AGRyM1sEQioLrd2kbDc3KyAQ0mWTBmoFsUxmuJGmnt7G9LaIPuFOzPcwpT04J7Se+2FZTpOmyE+j2tW3pFTDbd+QT0A=
X-Received: by 2002:a0d:ea57:0:b0:31e:55f4:a03d with SMTP id
 t84-20020a0dea57000000b0031e55f4a03dmr10146248ywe.425.1658759579699; Mon, 25
 Jul 2022 07:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220721130116.43366-1-yangyicong@huawei.com> <CANLsYkwMsmnj4CaqGigmBa4snn75iGkvE6tUDgHiMNsP3003zA@mail.gmail.com>
 <7adf0c72-521d-f117-5b5f-f8ce0ada44bd@gmail.com>
In-Reply-To: <7adf0c72-521d-f117-5b5f-f8ce0ada44bd@gmail.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 25 Jul 2022 08:32:47 -0600
Message-ID: <CANLsYkwkUXU6NO1f48dDSDWAf9=bdzTyrPvcf1YuhiKzWFtu+g@mail.gmail.com>
Subject: Re: [PATCH v11 0/8] Add support for HiSilicon PCIe Tune and Trace device
To:     Yicong Yang <yangyccccc@gmail.com>
Cc:     alexander.shishkin@linux.intel.com, gregkh@linuxfoundation.org,
        leo.yan@linaro.org, james.clark@arm.com, will@kernel.org,
        robin.murphy@arm.com, acme@kernel.org, peterz@infradead.org,
        corbet@lwn.net, mark.rutland@arm.com, jonathan.cameron@huawei.com,
        john.garry@huawei.com, helgaas@kernel.org,
        lorenzo.pieralisi@arm.com, suzuki.poulose@arm.com, joro@8bytes.org,
        shameerali.kolothum.thodi@huawei.com, mingo@redhat.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pci@vger.kernel.org, linux-perf-users@vger.kernel.org,
        iommu@lists.linux-foundation.org, iommu@lists.linux.dev,
        linux-doc@vger.kernel.org, prime.zeng@huawei.com,
        liuqi115@huawei.com, zhangshaokun@hisilicon.com,
        linuxarm@huawei.com, yangyicong@hisilicon.com, bagasdotme@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 22 Jul 2022 at 08:53, Yicong Yang <yangyccccc@gmail.com> wrote:
>
> =E5=9C=A8 7/21/2022 11:43 PM, Mathieu Poirier =E5=86=99=E9=81=93:
> > On Thu, 21 Jul 2022 at 07:03, <yangyicong@huawei.com> wrote:
> >> From: Yicong Yang <yangyicong@hisilicon.com>
> >>
> >> HiSilicon PCIe tune and trace device (PTT) is a PCIe Root Complex
> >> integrated Endpoint (RCiEP) device, providing the capability
> >> to dynamically monitor and tune the PCIe traffic (tune),
> >> and trace the TLP headers (trace).
> >>
> >> PTT tune is designed for monitoring and adjusting PCIe link parameters=
.
> >> We provide several parameters of the PCIe link. Through the driver,
> >> user can adjust the value of certain parameter to affect the PCIe link
> >> for the purpose of enhancing the performance in certian situation.
> >>
> >> PTT trace is designed for dumping the TLP headers to the memory, which
> >> can be used to analyze the transactions and usage condition of the PCI=
e
> >> Link. Users can choose filters to trace headers, by either requester
> >> ID, or those downstream of a set of Root Ports on the same core of the
> >> PTT device. It's also supported to trace the headers of certain type a=
nd
> >> of certain direction.
> >>
> >> The driver registers a PMU device for each PTT device. The trace can
> >> be used through `perf record` and the traced headers can be decoded
> >> by `perf report`. The perf command support for the device is also
> >> added in this patchset. The tune can be used through the sysfs
> >> attributes of related PMU device. See the documentation for the
> >> detailed usage.
> >>
> >> Change since v10:
> >> - Use title case in the documentation
> >> - Add RB from Bagas, thanks.
> >> Link: https://lore.kernel.org/lkml/20220714092710.53486-1-yangyicong@h=
isilicon.com/
> >>
> >> Change since v9:
> >> - Add sysfs ABI description documentation
> >> - Remove the controversial available_{root_port, requester}_filters sy=
sfs file
> >> - Shorten 2 tune sysfs attributes name and add some comments
> >> - Move hisi_ptt_process_auxtrace_info() to Patch 6.
> >> - Add RB from Leo and Ack-by from Mathieu, thanks!
> > You can add my Ack-by to patch 03 as well.  See below for another comme=
nt.
>
> Thanks!
>
> >> Link: https://lore.kernel.org/lkml/20220606115555.41103-1-yangyicong@h=
isilicon.com/
> >>
> >> Change since v8:
> >> - Cleanups and one minor fix from Jonathan and John, thanks
> >> Link: https://lore.kernel.org/lkml/20220516125223.32012-1-yangyicong@h=
isilicon.com/
> >>
> >> Change since v7:
> >> - Configure the DMA in probe rather than in runtime. Also use devres t=
o manage
> >>   PMU device as we have no order problem now
> >> - Refactor the config validation function per John and Leo
> >> - Use a spinlock hisi_ptt::pmu_lock instead of mutex to serialize the =
perf process
> >>   in pmu::start as it's in atomic context
> >> - Only commit the traced data when stop, per Leo and James
> >> - Drop the filter dynamically updating patch from this series to simpl=
y the review
> >>   of the driver. That patch will be send separately.
> >> - add a cpumask sysfs attribute and handle the cpu hotplug events, fol=
low the
> >>   uncore PMU convention
> >> - Other cleanups and fixes, both in driver and perf tool
> >> Link: https://lore.kernel.org/lkml/20220407125841.3678-1-yangyicong@hi=
silicon.com/
> >>
> >> Change since v6:
> >> - Fix W=3D1 errors reported by lkp test, thanks
> >>
> >> Change since v5:
> >> - Squash the PMU patch into PATCH 2 suggested by John
> >> - refine the commit message of PATCH 1 and some comments
> >> Link: https://lore.kernel.org/lkml/20220308084930.5142-1-yangyicong@hi=
silicon.com/
> >>
> >> Change since v4:
> >> Address the comments from Jonathan, John and Ma Ca, thanks.
> >> - Use devm* also for allocating the DMA buffers
> >> - Remove the IRQ handler stub in Patch 2
> >> - Make functions waiting for hardware state return boolean
> >> - Manual remove the PMU device as it should be removed first
> >> - Modifier the orders in probe and removal to make them matched well
> >> - Make available {directions,type,format} array const and non-global
> >> - Using the right filter list in filters show and well protect the
> >>   list with mutex
> >> - Record the trace status with a boolean @started rather than enum
> >> - Optimize the process of finding the PTT devices of the perf-tool
> >> Link: https://lore.kernel.org/linux-pci/20220221084307.33712-1-yangyic=
ong@hisilicon.com/
> >>
> >> Change since v3:
> >> Address the comments from Jonathan and John, thanks.
> >> - drop members in the common struct which can be get on the fly
> >> - reduce buffer struct and organize the buffers with array instead of =
list
> >> - reduce the DMA reset wait time to avoid long time busy loop
> >> - split the available_filters sysfs attribute into two files, for root=
 port
> >>   and requester respectively. Update the documentation accordingly
> >> - make IOMMU mapping check earlier in probe to avoid race condition. A=
lso
> >>   make IOMMU quirk patch prior to driver in the series
> >> - Cleanups and typos fixes from John and Jonathan
> >> Link: https://lore.kernel.org/linux-pci/20220124131118.17887-1-yangyic=
ong@hisilicon.com/
> >>
> >> Change since v2:
> >> - address the comments from Mathieu, thanks.
> >>   - rename the directory to ptt to match the function of the device
> >>   - spinoff the declarations to a separate header
> >>   - split the trace function to several patches
> >>   - some other comments.
> >> - make default smmu domain type of PTT device to identity
> >>   Drop the RMR as it's not recommended and use an iommu_def_domain_typ=
e
> >>   quirk to passthrough the device DMA as suggested by Robin.
> >> Link: https://lore.kernel.org/linux-pci/20211116090625.53702-1-yangyic=
ong@hisilicon.com/
> >>
> >> Change since v1:
> >> - switch the user interface of trace to perf from debugfs
> >> - switch the user interface of tune to sysfs from debugfs
> >> - add perf tool support to start trace and decode the trace data
> >> - address the comments of documentation from Bjorn
> >> - add RMR[1] support of the device as trace works in RMR mode or
> >>   direct DMA mode. RMR support is achieved by common APIs rather
> >>   than the APIs implemented in [1].
> >> Link: https://lore.kernel.org/lkml/1618654631-42454-1-git-send-email-y=
angyicong@hisilicon.com/
> >> [1] https://lore.kernel.org/linux-acpi/20210805080724.480-1-shameerali=
.kolothum.thodi@huawei.com/
> >>
> >> Qi Liu (3):
> >>   perf tool: arm: Refactor event list iteration in
> >>     auxtrace_record__init()
> >>   perf tool: Add support for HiSilicon PCIe Tune and Trace device driv=
er
> >>   perf tool: Add support for parsing HiSilicon PCIe Trace packet
> >>
> >> Yicong Yang (5):
> >>   iommu/arm-smmu-v3: Make default domain type of HiSilicon PTT device =
to
> >>     identity
> >>   hwtracing: hisi_ptt: Add trace function support for HiSilicon PCIe
> >>     Tune and Trace device
> >>   hwtracing: hisi_ptt: Add tune function support for HiSilicon PCIe Tu=
ne
> >>     and Trace device
> >>   docs: trace: Add HiSilicon PTT device driver documentation
> >>   MAINTAINERS: Add maintainer for HiSilicon PTT driver
> >>
> >>  .../ABI/testing/sysfs-devices-hisi_ptt        |   61 +
> >>  Documentation/trace/hisi-ptt.rst              |  298 +++++
> >>  Documentation/trace/index.rst                 |    1 +
> >>  MAINTAINERS                                   |    8 +
> >>  drivers/Makefile                              |    1 +
> >>  drivers/hwtracing/Kconfig                     |    2 +
> >>  drivers/hwtracing/ptt/Kconfig                 |   12 +
> >>  drivers/hwtracing/ptt/Makefile                |    2 +
> >>  drivers/hwtracing/ptt/hisi_ptt.c              | 1032 ++++++++++++++++=
+
> >>  drivers/hwtracing/ptt/hisi_ptt.h              |  200 ++++
> >>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |   21 +
> > Everything above needs to go in one patchset and everything below in
> > another one.  The first patchset will need to be merged before the
> > second one.  Someone already commented on that.
>
> ok. I put them together to provide an overall view of this and thought ma=
intainers can take
> them separately. Will spilt the driver part and perf tool patches.
>
> I still don't know who will finally take the driver part. It should be Al=
exander from maintainer
> list but I got no response yet for a long time. Any hint for this?

It will either be Peter, Greg or myself.  We'll see when we get there.
