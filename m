Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEC7A10FD92
	for <lists+linux-doc@lfdr.de>; Tue,  3 Dec 2019 13:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbfLCM0F (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 3 Dec 2019 07:26:05 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:39564 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbfLCM0F (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Dec 2019 07:26:05 -0500
Received: by mail-qt1-f195.google.com with SMTP id g1so3522261qtj.6
        for <linux-doc@vger.kernel.org>; Tue, 03 Dec 2019 04:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KCV6d9hCioXwDxQSc+9jtdCsRf9f3DSaaCIPQTYGbKY=;
        b=bpJPXACy569Uou4xeEkwZe9zGcFmIVFTruFj2RkHy7VtyGHrOoGRz3FqXS6kIL+sRo
         daMX5qEwAaWytvZEWpXQrsbW2BR8GJe0aPT3Cj7ggNoQNY3Dh2zJwsQVDGqIjqUv/hdQ
         v2w7Is0MN86M34UBMlqsoquVNzg/LUCns7zy7DYnvPW3vKggDzp9hAMv6pdFnZgEqcvf
         C4CXXVbJGvuwu7Bf8+AGrGMJmfi+XQ46PkOQY/Y8DnSF1xg5jRT4EnhFTXMHrLm63DYi
         Nr3L1gbqGsTXMpQbHcQsMQwZRuobk3Bz4Nzsvvx5aTaYSsezK7fEDiHD4k3YJUebl9YQ
         mqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KCV6d9hCioXwDxQSc+9jtdCsRf9f3DSaaCIPQTYGbKY=;
        b=KL43s1NhVHj46EKitdQ4fyuuRMm+SnGylmlrtgX843gGgg2k2rKEumcpaG6UOt1Upt
         0ByUx/yZq5M7eKplSgJc+0HULKZjPXqvpxa85UAswuLI6hlRNW2Bw1ztCuxi9RB3zSUg
         Im9wm3UVH/Lthh8z65X8/76mmtvAECqNk/ZONGxYDUuMB9TPPBVlljnn8k+tTS7VLKWN
         VFxWnq8R4iBjwxckFHDMGjD8OFT6ge8DnUwMhHWEekA7vyG8MGM9P/31xFcRWsVB7RUG
         f7D16mWCRrvCgrgXEg/iASF9KoYMFOc66hD6yOvakOcjhNeBAZroBQ0Aq7Bvs9S7GIKT
         PtfA==
X-Gm-Message-State: APjAAAWaT4r1mKpKQXle95/Gx3J/gj3JTB5md3CpUDfO/BTYBo9xZ2zA
        xhAYK4Frs5CJEuCXiKTYifzOj5W/8lQooT4EeGQkTQvB
X-Google-Smtp-Source: APXvYqweLlybh/rT5gfnZhz0yyuec8Zuu65/mrhliV+x4arFaG745EaW3zCKngE6hVl+mIngkPeM29sDhed2WB7clT0=
X-Received: by 2002:ac8:1098:: with SMTP id a24mr4859094qtj.62.1575375964252;
 Tue, 03 Dec 2019 04:26:04 -0800 (PST)
MIME-Version: 1.0
References: <20191119231912.12768-1-mike.leach@linaro.org> <20191119231912.12768-7-mike.leach@linaro.org>
 <b2f640d3-c320-82d4-7399-172846820589@arm.com> <CAJ9a7VgkgoUTL0+_3kj53go_CKtAH3fO5xF9UNDPPz1se1SKSw@mail.gmail.com>
 <ffda8aff-0904-7292-e2f1-93833b936c49@arm.com>
In-Reply-To: <ffda8aff-0904-7292-e2f1-93833b936c49@arm.com>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Tue, 3 Dec 2019 12:25:52 +0000
Message-ID: <CAJ9a7VgH6tueHP_bCcwKzORbBxxADrRhUzPaSe=3NixCC05=Dw@mail.gmail.com>
Subject: Re: [PATCH v5 06/14] coresight: cti: Add device tree support for v8
 arch CTI
To:     Suzuki Kuruppassery Poulose <suzuki.poulose@arm.com>
Cc:     Coresight ML <coresight@lists.linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Suzuki,

On Tue, 3 Dec 2019 at 11:28, Suzuki Kuruppassery Poulose
<suzuki.poulose@arm.com> wrote:
>
> On 03/12/2019 10:59, Mike Leach wrote:
> > Hi Suzuki,
> >
> > On Fri, 29 Nov 2019 at 11:33, Suzuki Kuruppassery Poulose
> > <suzuki.poulose@arm.com> wrote:
> >>
> >> On 19/11/2019 23:19, Mike Leach wrote:
> >>> The v8 architecture defines the relationship between a PE, its optional ETM
> >>> and a CTI. Unlike non-architectural CTIs which are implementation defined,
> >>> this has a fixed set of connections which can therefore be represented as a
> >>> simple tag in the device tree.
> >>>
> >>> This patch defines the tags needed to create an entry for this PE/ETM/CTI
> >>> relationship, and provides functionality to implement the connection model
> >>> in the CTI driver.
> >>>
> >>> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> >>> ---
>
>
> >>> +#ifdef CONFIG_OF
> >>> +/*
> >>> + * CTI can be bound to a CPU, or a system device.
> >>> + * CPU can be declared at the device top level or in a connections node
> >>> + * so need to check relative to node not device.
> >>> + */
> >>> +static int of_cti_get_cpu_at_node(const struct device_node *node)
> >>> +{
> >>> +     int cpu;
> >>> +     struct device_node *dn;
> >>> +
> >>> +     if (node == NULL)
> >>> +             return -1;
> >>> +
> >>> +     dn = of_parse_phandle(node, "cpu", 0);
> >>> +     /* CTI affinity defaults to no cpu */
> >>> +     if (!dn)
> >>> +             return -1;
> >>> +     cpu = of_cpu_node_to_id(dn);
> >>> +     of_node_put(dn);
> >>> +
> >>> +     /* No Affinity  if no cpu nodes are found */
> >>> +     return (cpu < 0) ? -1 : cpu;
> >>> +}
> >>> +
> >>> +static const char *of_cti_get_node_name(const struct device_node *node)
> >>> +{
> >>> +     if (node)
> >>> +             return node->full_name;
> >>> +     return "unknown";
> >>> +}
> >>> +#else
> >>> +static int of_cti_get_cpu_at_node(const struct device_node *node)
> >>> +{
> >>> +     return -1;
> >>> +}
> >>> +
> >>> +static const char *of_cti_get_node_name(const struct device_node *node)
> >>> +{
> >>> +     return "unknown";
> >>> +}
> >>> +#endif
> >>> +
> >>> +static int cti_plat_get_cpu_at_node(struct fwnode_handle *fwnode)
> >>> +{
> >>
> >> You may simply reuse coresight_get_cpu() below, instead of adding this
> >> duplicate set of functions. See below.
> >>
> >>
> >
> > No we can't. coresight_get_cpu gets the 'cpu' entry relative to the
> > device node, this gets the 'cpu' relative to the supplied node.
> > This is very important for the case where a none v8 architected PE is
> > attached to a CTI. This will use the devicetree form:-
> >
> > cti@<addr> {
> >      [ some stuff  ]
> >     trig_conns@1 {
> >            cpu = <&CPU0>
> >            [trigger signal  connection info for this cpu]
> >     }
> > }
> >
> > trig_conns is a child node and we must look for 'cpu' relative to it.
>
> Ok. May be we could refactor the function to find the 'CPU' node
> relative to the given "fwnode" and let the coresight_get_cpu() use it ?
>
> int coresight_get_cpu(struct device *dev)
> {
>         return coresight_get_fwnode_cpu(dev_fwnode(dev));
> }
>
> That way it is clear what we are dealing with. i.e, fwnode of any level
> (device or an intermediate node).
>

At present the generic coresight_get_cpu() deals with both DT and ACPI
bindings.
To refactor this would require re-factoring both binding types - and
at present we have no definition for ACPI bindings for CTI and hence
no way of knowing how the embedded cpu node is going to be
represented.

I think we have to take just the DT binding as is for now as a CTI
specific element and consider if it is worth re-factoring once the
ACPI bindings are defined

Regards

Mike

> >>> +     csdev = cti_get_assoc_csdev_by_fwnode(cs_fwnode);
> >>> +     if (csdev)
> >>> +             assoc_name = dev_name(&csdev->dev);
> >>
> >> Does it make sense to defer the probing until the ETM device  turn up ?
> >> Its fine either way.
> >>
> >
> > Not really as the ETM is optional but the PE still has a CTI.
>
> Ah, you're right. Please ignore my comment.
>
> Kind regards
> Suzuki



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
