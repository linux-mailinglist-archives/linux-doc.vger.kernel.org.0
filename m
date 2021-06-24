Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 833CF3B3458
	for <lists+linux-doc@lfdr.de>; Thu, 24 Jun 2021 19:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbhFXRLq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 24 Jun 2021 13:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232156AbhFXRLm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Jun 2021 13:11:42 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC6FC061574
        for <linux-doc@vger.kernel.org>; Thu, 24 Jun 2021 10:09:22 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id q18so7043624ile.10
        for <linux-doc@vger.kernel.org>; Thu, 24 Jun 2021 10:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to;
        bh=ANhbTggsY3NFhRZExKMwUmb3VzJqye8XLvWVXSvNBkQ=;
        b=p95plxgcKdT8+TUJCmcKdAyJL6L8C+j3muAeTI6tbvEOMwKUFZvBH22Z3GEGxdnUZH
         d9XkDasjcz/bUj2n1PkWxPPQL/Sxtf1a7ckN43IkWwU4a9v6DYeOi9Tg8DPYHl700hH/
         xlmv54Ir2NUVB8zwaX1UsxTzP5GUW3mdywmszCeflzWKbXzDgkMNhx+qVsi3FklHnD5x
         fSDWvxz3POXOJ/0yZM+F2G99rPMTFJK+bPA5TWYu0VJpvpEjmQwRSgXLB6dx+kXpC0Uz
         JX+JhI0lSB7VkwJTdkbApCrUx6TGzp99N5mAm/d0lil4hmexz93RFAPSpMzmwkjNchKB
         rXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to;
        bh=ANhbTggsY3NFhRZExKMwUmb3VzJqye8XLvWVXSvNBkQ=;
        b=tfT9bsqGQobPB276GTaiCyhtuSPxzyU8myjE7IYvO1/RxQAARsmM4fFEDbUhHUlKNs
         dxOr1HEZuup47zRkXdhuJWqtYJekofnujblL1Wv091dG/sF2JDqh1hv+LZ/Ly5fa68rq
         r2xUVbsEShqsPup/Jn1IxLZjEGvDEYzR2pe1nF7j85Y2xC4Ywfdd5MW5wNvH8nOfTf2m
         KtNBSbXXErQmD5br9gmnH6+WvXTYEM03vBArY6lfvP5ure2x55qWcJipeOFv/yumqEy9
         ptBnj3+BNXUWyqS9GZwBNwz2GwJd+sedKZ0j8/r9DD/Ue8/OleVZ3PUSnSKlPh/5KjPJ
         nYZg==
X-Gm-Message-State: AOAM531yCQpQNEnHEmRyieBLyOu3kBGPFlqC5emEg8k3gKbZFEGKu5gU
        BjO3aaexIO58b4eOvOohgZQtuJc+oHnvHE2k3eM=
X-Google-Smtp-Source: ABdhPJzkYUuO368jts0QgMQyJe9SHzg0U698qd8KdfojEfYsXnHtwMfPGxVHmw7fwQ64+IhHRhAEJH5nusdeW4BWzcA=
X-Received: by 2002:a05:6e02:524:: with SMTP id h4mr4098121ils.255.1624554560853;
 Thu, 24 Jun 2021 10:09:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6638:3aa:0:0:0:0 with HTTP; Thu, 24 Jun 2021 10:09:20
 -0700 (PDT)
Reply-To: tutywoolgar021@gmail.com
In-Reply-To: <CADB47+4Wa3T59Vq_==GTXEfHrX5x-2vQFxaTBO0dTdyAweCVpw@mail.gmail.com>
References: <CADB47+4Wa3T59Vq_==GTXEfHrX5x-2vQFxaTBO0dTdyAweCVpw@mail.gmail.com>
From:   tuty woolgar <faridaamadoubas@gmail.com>
Date:   Thu, 24 Jun 2021 17:09:20 +0000
Message-ID: <CADB47+607zNBfYFb4bj0nUhuuYgAdwT=G_wJ9-EeV0ESHe56Jg@mail.gmail.com>
Subject: greetings,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

My greetings to you my friend i hope you are fine and good please respond
back to me thanks,
