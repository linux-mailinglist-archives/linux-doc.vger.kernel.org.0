Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55C8539E82F
	for <lists+linux-doc@lfdr.de>; Mon,  7 Jun 2021 22:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbhFGURc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 7 Jun 2021 16:17:32 -0400
Received: from mail-pf1-f180.google.com ([209.85.210.180]:35585 "EHLO
        mail-pf1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231224AbhFGURb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Jun 2021 16:17:31 -0400
Received: by mail-pf1-f180.google.com with SMTP id h12so11120851pfe.2
        for <linux-doc@vger.kernel.org>; Mon, 07 Jun 2021 13:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L7rpankvGLItroXIy6lBPDNJd2uTfY22CCQPQ/XjOqw=;
        b=D4+dK8IR3YTVfzG/TXJ7zk/9sZWwjoSz+w+pbNpf62hi2i64DAyD0x5Sw0Awu48SEw
         tEmEwpTou/M6xrq3m8/EIxaQ0kli67rT9g/dH63ahpj7sGjT+mZNZWdUSwoidLKJCNni
         SSRuIZ70/Svn2YCnMtEfMVx9ITWcpBN05YM6BurUupEYDaW8/R1bZEefCaCgbZ4ER+dp
         i9ZV7IRigciiqx4POmv+JD85qZGr16tNzrp2t368bwyhIiS0pnLwDv5NaVEmVLws9Fok
         FMARqnrbxSs1uR3IV+thlGXifoe68/ac8wRrjjmsROVh3D7dAcLBmYIJkAjorc/gl5lu
         1Gzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L7rpankvGLItroXIy6lBPDNJd2uTfY22CCQPQ/XjOqw=;
        b=QK0PZqtw6PrdWYOiKeeg4u7JsETUh48xUu/Mx+wWJY7QVqPxp6hSbvjw4dE9bnCnyQ
         q8rX5Y8prT7op3KK2eMg8bt/2hnTZ+wJgAV4UltKNa2AWNeo8n8zsO4O49wlK/53+4ih
         5GwipAqsSxXY2MiBUSNXh+vV+x7pno32aneiCtW+3gUGswwhMoCXTSzjrzCRh4gIWqbF
         pURoVv7gXpoaQ3UZFP5GFC11gcEHqWqf8c/oM5xDSteC8Ixncnx6IutYmTZBxMnNNtkL
         dLCICaNnnD1qiZ5WaAT/ko9UzhnHSTzlD80m/B4ttvu0CpZ6SIRZrkiC9v/bcOP29jeF
         k7pQ==
X-Gm-Message-State: AOAM532R1KhbORHGPFGwPklTAVyvbMs9Jrw6cJoAk5dNXWX6PLz/bYSn
        ktymGZJR0IPFsdsHShOZgL/58p2ZEg5wCivORj9g0Q==
X-Google-Smtp-Source: ABdhPJzEw8cm/NrkBFDUDuy7jVAtclHleIKn0U4xudYPyuV1EIQL8Sj2oL1noGD8zsxB8+Luzqlj6umWBD2LDr8hSbg=
X-Received: by 2002:a63:d0d:: with SMTP id c13mr5466147pgl.384.1623096866188;
 Mon, 07 Jun 2021 13:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1622898327.git.mchehab+huawei@kernel.org> <08ac283ac5bdc2664255a7ad34514e50d3ed85d8.1622898327.git.mchehab+huawei@kernel.org>
In-Reply-To: <08ac283ac5bdc2664255a7ad34514e50d3ed85d8.1622898327.git.mchehab+huawei@kernel.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Mon, 7 Jun 2021 13:14:15 -0700
Message-ID: <CAFd5g45i-TPESs-cDosU29vcvjnjr1L0WvNqX6ZgD_-QvHW82Q@mail.gmail.com>
Subject: Re: [PATCH 02/34] docs: dev-tools: kunit: don't use a table for docs name
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
> We'll be replacing :doc:`foo` references to
> Documentation/foo.rst. Yet, here it happens inside a table.
> Doing a search-and-replace would break it.
>
> Yet, as there's no good reason to use a table there,
> let's just convert it into a list.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks!

Acked-by: Brendan Higgins <brendanhiggins@google.com>
