Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5D639E852
	for <lists+linux-doc@lfdr.de>; Mon,  7 Jun 2021 22:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231722AbhFGUXr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 7 Jun 2021 16:23:47 -0400
Received: from mail-pg1-f172.google.com ([209.85.215.172]:41889 "EHLO
        mail-pg1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231640AbhFGUXr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Jun 2021 16:23:47 -0400
Received: by mail-pg1-f172.google.com with SMTP id r1so14712965pgk.8
        for <linux-doc@vger.kernel.org>; Mon, 07 Jun 2021 13:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J6VRubZZpq1XH7ANuEphxYH1pIMlT6KAwEM9rQIhbLw=;
        b=T0+Q5JBENvQw3ma8SwTqzCMg27MF5xM9rwImeT3LsoqGnjm+0b2E+apHjUp4O9x0mM
         ebtQbATDXp8dkxs7TK1hSBWijItA5xP6TGrEoxCXJ+E5PgqtlXq2bRyjvQn2qP3fUX9E
         1UE+IVHATNwMAEgpa6/0EwhqRRnZVxfMDKXoUW/nrEk6n1xMDbi+EqZFR4MBW2m3Hp8l
         PWrwhEBMbK4aVmVDrxfskpMZpCvtPnsyDf8kyExNPhvuHsFRV2rSRnVQNnJGM9bcZIle
         KsxtCDThGZfX53aj20tYsMnFZbSErzhSdmetssL0EwstdrNB1/5d52L8COOtMJffFpt4
         F90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J6VRubZZpq1XH7ANuEphxYH1pIMlT6KAwEM9rQIhbLw=;
        b=BPutB+S3ZEvivfVh4+eqDe5N44I/TgMZpqWVExfpauDFODIV+DZhxEnC4PievjTt7M
         sHFNULr09NLmCUg4mGvlDL0p7kWGcFQDULnAYa010X+TS2N77I+7JlVOKGom0DK570zO
         A3QtaPMRqoUqzaIlMdoZHdsUMCxyoNhRFsbQFDr508vSwkfxyi9ItTNqQzQw9YSjfS/G
         e2YpnUe/w54KEWDZOZcabzgRQ0R66lp6xEwyElsvPrnfWyPs0xKY6K7ZhOOfmWUeKncC
         tC2X+AAlEkQTxWCARPVvZU1RkfzZyaGTApoKfSNQe2SOmalCxpWfxZdCNxvPTCTCOJY+
         MSYw==
X-Gm-Message-State: AOAM530Bx6hy74i35iPk0f/S4yXfy1AmErUebtbgAdj3nVJ38bTgl5w/
        olF3nR5QA9ItLgJet7dCydfZ1WUqepSNIlz/ArMbDA==
X-Google-Smtp-Source: ABdhPJxplpK63WT3X917DKM/+k9nlls1jKrUu2p7oyEHwR0Mxqo0ar1vNH/PeR0NMYyVapvmGKDYzFMkSclYtdfldhw=
X-Received: by 2002:a63:485a:: with SMTP id x26mr16802795pgk.159.1623097245697;
 Mon, 07 Jun 2021 13:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1622898327.git.mchehab+huawei@kernel.org> <a3ad84108a5b254e545f88e58d411f5fe2e25c7e.1622898327.git.mchehab+huawei@kernel.org>
In-Reply-To: <a3ad84108a5b254e545f88e58d411f5fe2e25c7e.1622898327.git.mchehab+huawei@kernel.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Mon, 7 Jun 2021 13:20:34 -0700
Message-ID: <CAFd5g447y+njXxZTwifEkd1f_B5XgCugAau4CDcVBzuwcOdvwg@mail.gmail.com>
Subject: Re: [PATCH 14/34] docs: dev-tools: kunit: avoid using ReST :doc:`foo` markup
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jun 5, 2021 at 6:18 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> The :doc:`foo` tag is auto-generated via automarkup.py.
> So, use the filename at the sources, instead of :doc:`foo`.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks!

Acked-by: Brendan Higgins <brendanhiggins@google.com>
