Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A46DA355795
	for <lists+linux-doc@lfdr.de>; Tue,  6 Apr 2021 17:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345585AbhDFPUx (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 6 Apr 2021 11:20:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345588AbhDFPUw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Apr 2021 11:20:52 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA243C061756
        for <linux-doc@vger.kernel.org>; Tue,  6 Apr 2021 08:20:44 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id qo10so12201010ejb.6
        for <linux-doc@vger.kernel.org>; Tue, 06 Apr 2021 08:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nDwJiLco4G2YxXOMk6DqG6IU0iXQSCZkWcN0h8cbo08=;
        b=b2FM3Nziaalt3+fcItmukxzfJUKusu7jA+qQg1eSgJ3mxyYKR5inViY/tDkfa9xWAV
         vgnv01l6CzKO2GOI1Ac3uYg7D9j8+kebtKWGM21wbIKTIjovxxn8VSImwiNxMsPMzhFx
         Ewz8nZWZ+fCcn1JJWRtBUoGh7OhGDEth/HhtYbFWU8vf6qQvgkJGtNG3Edr8igIHGf/Q
         reVYfona/uEga4aKR9IxEB5Jj1HzpiJ6g2m9/sPz3Lwb/taswLPTxiyIXUSsJ1/zc9XI
         E2V+ThWOhx2phVplC5v7c5mtlIk39mL1B/gaUKhvOBwsemUi93eik8cNfUJfcpXbNJAA
         WVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nDwJiLco4G2YxXOMk6DqG6IU0iXQSCZkWcN0h8cbo08=;
        b=PT6wg17RFcjQJ+J5/7pw7ltwNFIm/0A9EVZhm0ox7Vb+PuG8Q1UUnmz5dPPVEBBNZh
         /cMJXdPmRsfMb3KYYhyiEt9bvoF+6VRfnClw99FeGj9q6iIvJ+5fK2k8rtEBlspoPLc4
         SD4D7Pgwz8Q6lepuUW/n3PqZoPO1hFhD2oKELd3ZkeEIfy67Lxq535XchjoYDoq4k6TI
         t22OYoGtjCum06IlKheftvYAPtFtBTVUFCJREUDb2kYaui4Kn9WrQkVD2pcCM++JvwpE
         vSOeXFAbQzOXpxcPevPF9lo66NkA7HtmRkuu5qa7y5G8v3CFdHxSfmJqiUbC2mMlLfhs
         05JA==
X-Gm-Message-State: AOAM5334mA7iqp0hmVo/0AtEs8PU9FOEs6zuqphIgaa1N3XcURRvX34j
        aWRH5mCYK8Ek432DhHx5Tfb6EbyQILNT0ARDLxRIug==
X-Google-Smtp-Source: ABdhPJxf4Wal1XDPlYEgQfXA/wpJ0hGRyL6qbv1NSRs9R18eAuYpCRPKFJzw9dE4YVz6zVPItGB/9ZTwr/qTvKc6o+o=
X-Received: by 2002:a17:906:190d:: with SMTP id a13mr12743433eje.330.1617722443402;
 Tue, 06 Apr 2021 08:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210406115049.196527-1-gi-oh.kim@ionos.com> <6DBCD231-E108-4F4C-AFBF-688E988DACD7@oracle.com>
In-Reply-To: <6DBCD231-E108-4F4C-AFBF-688E988DACD7@oracle.com>
From:   Gioh Kim <gi-oh.kim@ionos.com>
Date:   Tue, 6 Apr 2021 17:20:07 +0200
Message-ID: <CAJX1YtYcGJkTH6CyV7uoudVuRamYUVeA6UbmQkEfYq+rxTH=Gw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Enable Fault Injection for RTRS
To:     Chuck Lever III <chuck.lever@oracle.com>
Cc:     linux-rdma <linux-rdma@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "bvanassche@acm.org" <bvanassche@acm.org>,
        "leon@kernel.org" <leon@kernel.org>,
        "dledford@redhat.com" <dledford@redhat.com>,
        "jgg@ziepe.ca" <jgg@ziepe.ca>,
        "haris.iqbal@ionos.com" <haris.iqbal@ionos.com>,
        "jinpu.wang@ionos.com" <jinpu.wang@ionos.com>,
        "akinobu.mita@gmail.com" <akinobu.mita@gmail.com>,
        "corbet@lwn.net" <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 6, 2021 at 4:20 PM Chuck Lever III <chuck.lever@oracle.com> wrote:
>
>
>
> > On Apr 6, 2021, at 7:50 AM, Gioh Kim <gi-oh.kim@ionos.com> wrote:
> >
> > My colleagues and I would like to apply the fault injection
> > of the Linux to test error handling of RTRS module. RTRS module
> > consists of client and server modules that are connected via
> > Infiniband network. So it is important for the client to receive
> > the error of the server and handle it smoothly.
>
> I am a fan of fault injection. In fact I added a disconnect fault
> injector for RPC that's in the kernel now, and it uses debugfs
> as its control interface.
>
> But that was years ago. If I were doing this today, I'd consider
> kprobes, since fault injection is generally not something that
> is consumed by users or administrators in a distributed kernel.
>
> Have you considered injection via kprobes or eBPF instead of
> adding permanent code?

I have not considered the eBPF yet.
I will have a discussion with my colleagues about that.
Thank you for the information.


>
>
> > When debugfs is enabled, RTRS is able to export interfaces
> > to fail RTRS client and server.
> > Following fault injection points are enabled:
> > - fail a request processing on RTRS client side
> > - fail a heart-beat transferation on RTRS server side
> >
> > This patch set is just a starting point. We will enable various
> > faults and test as many error cases as possible.
> >
> > Best regards
> >
> > Gioh Kim (4):
> >  RDMA/rtrs: Enable the fault-injection
> >  RDMA/rtrs-clt: Inject a fault at request processing
> >  RDMA/rtrs-srv: Inject a fault at heart-beat sending
> >  docs: fault-injection: Add fault-injection manual of RTRS
> >
> > .../fault-injection/rtrs-fault-injection.rst  | 83 +++++++++++++++++++
> > drivers/infiniband/ulp/rtrs/Makefile          |  2 +
> > drivers/infiniband/ulp/rtrs/rtrs-clt-sysfs.c  | 44 ++++++++++
> > drivers/infiniband/ulp/rtrs/rtrs-clt.c        |  7 ++
> > drivers/infiniband/ulp/rtrs/rtrs-clt.h        | 13 +++
> > drivers/infiniband/ulp/rtrs/rtrs-fault.c      | 52 ++++++++++++
> > drivers/infiniband/ulp/rtrs/rtrs-fault.h      | 28 +++++++
> > drivers/infiniband/ulp/rtrs/rtrs-srv-sysfs.c  | 44 ++++++++++
> > drivers/infiniband/ulp/rtrs/rtrs-srv.c        |  5 ++
> > drivers/infiniband/ulp/rtrs/rtrs-srv.h        | 13 +++
> > 10 files changed, 291 insertions(+)
> > create mode 100644 Documentation/fault-injection/rtrs-fault-injection.rst
> > create mode 100644 drivers/infiniband/ulp/rtrs/rtrs-fault.c
> > create mode 100644 drivers/infiniband/ulp/rtrs/rtrs-fault.h
> >
> > --
> > 2.25.1
> >
>
> --
> Chuck Lever
>
>
>
