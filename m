Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB0C1E73B5
	for <lists+linux-doc@lfdr.de>; Fri, 29 May 2020 05:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436976AbgE2Djb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 28 May 2020 23:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436742AbgE2Dj3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 May 2020 23:39:29 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA312C08C5C6
        for <linux-doc@vger.kernel.org>; Thu, 28 May 2020 20:39:28 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id h21so653121ejq.5
        for <linux-doc@vger.kernel.org>; Thu, 28 May 2020 20:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5gkHrDdBZqERh5JBp6Y5+S43JYLC8jaN53SGk0qrPig=;
        b=tZVJVopV+f4WJUZpvluec/FtHcYdjJXPP2ck6LxU8clVsVj9zgyZtBVUjciDg8Ig6V
         JCJG0m20tjPin5MieQiZ/EbVrZCvK+fiwoRH/VMDXCf7FejLjIFyCQENT/alqmF87xco
         J1vrCZLiBUHa07qm9vpJdL8/hiWCjMIy/gZDBTT9x78lfAl69zaBmWfWWHbDZnW4UK/f
         k7CU3tF1sTI1HIWtG7v3zAUfpFVEEbbrWALS0lCXk2X3NBpAjhHbGfDxMNZ3DWltS9wi
         ELn/uZqcOCUDw+ljkrkBAS6gB0dCRSnk/cGEtTQHOB4ssecCWLiBlCENZF2abBmglV5i
         lEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5gkHrDdBZqERh5JBp6Y5+S43JYLC8jaN53SGk0qrPig=;
        b=DKlx1Zm/8XQwMnKIbYbuwCbuI0UEzkLSaKoao1DkAu1X731M1mIPFqa7E9YsOEEDd0
         16xleVl7+akkqaIBXfWy9OgLQ/Yk0Gz4MhFY7j3E1X21Hhu2U3Mccn3layt9pwx2eF5R
         Y6hxC8AD1DviGOv4G+Xy1adxLQ5uhJySGLqz99eielmdF18z8pScaXVMkWsTdLJnw+X9
         CuBzlIlzGWii85pDBeywdsVRhYkDLcAHWbozgbtes/jeKEpIEaQaym6o4yhfHljxDbJi
         1y76jfn6EZzbSFVmb7zV/yYnRxteFCW8oLtFu2P69pqsMTugFxv6w588FAcVFwO0Vnsu
         G3/Q==
X-Gm-Message-State: AOAM530P7gP0PHu/pH7NLQT3U+uVOXXi2GRAPRsuJYg26A5liaURxik8
        o26rDbbvItLajLL09YHvp5H9CaRqhtnKyXmAxcfT0w==
X-Google-Smtp-Source: ABdhPJzFjMAgGzbJf9X7YASkkjr3BxDpArKTPedMsTfDqle3ScyLuzBrbqg1nfHwvrNcbo0gM0Xef9axKVwGV/pRcdM=
X-Received: by 2002:a17:906:1a06:: with SMTP id i6mr6213718ejf.9.1590723567709;
 Thu, 28 May 2020 20:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200514092637.15684-1-John.Mathew@unikie.com> <20200525103511.6966206b@lwn.net>
In-Reply-To: <20200525103511.6966206b@lwn.net>
From:   John Mathew <john.mathew@unikie.com>
Date:   Fri, 29 May 2020 06:39:17 +0300
Message-ID: <CAJz2qX=omnxpXKhkdWNgb9z3zw0froqfzzhne0wCJTtTZOnobQ@mail.gmail.com>
Subject: Re: [RFC PATCH v5 0/3] Add scheduler overview documentation
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        rostedt@goodmis.org, Benjamin Segall <bsegall@google.com>,
        mgorman@suse.de, bristot@redhat.com, tsbogend@alpha.franken.de,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@gmail.com, willy@infradead.org,
        Valentin Schneider <valentin.schneider@arm.com>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 25, 2020 at 7:35 PM Jonathan Corbet <corbet@lwn.net> wrote:
>
> On Thu, 14 May 2020 12:26:34 +0300
> john mathew <john.mathew@unikie.com> wrote:
>
> > This patch series updates the scheduler documentation to add more topics
> > wrt to scheduler overview. New sections are added to provide a brief
> > overview of the kernel structs used by the scheduler, scheduler invocation,
> > context switch and Capacity Aware Scheduling. Previous version of
> > the patch was reviewed at:
> > Link: https://lore.kernel.org/lkml/20200513134338.19688-2-John.Mathew@unikie.com/
>
> Did we ever reach a conclusion on this series?  I don't see a lot of acks
> there yet, so I'm a little leery about applying it...
>
> Thanks,
>
> jon

Jonathan,  the latest version iof the patchset is at at
https://lore.kernel.org/lkml/20200527084421.4673-1-John.Mathew@unikie.com/
Peter, Daniel, Matthew, Juri, Valentin, Randy, Tao and Dietmar can you
take a look and give acks if ok?
