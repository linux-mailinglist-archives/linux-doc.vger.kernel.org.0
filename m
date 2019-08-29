Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3243FA2277
	for <lists+linux-doc@lfdr.de>; Thu, 29 Aug 2019 19:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbfH2Ri2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 29 Aug 2019 13:38:28 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34896 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727410AbfH2Ri2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 13:38:28 -0400
Received: by mail-pl1-f193.google.com with SMTP id gn20so1914408plb.2
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2019 10:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xX6NnJBlZc5HyDgcExXc1+tZLWs5dKl2iDR8wStwjWU=;
        b=OAVX0H28lnD1pzeaJLYvwWm5h6edzg+3fsQQobLecwv+hfmSzOI3+ovBUb5NBY03iF
         /Bu42a0DxZD1qhadBjv+kGAuHzm7q5GE7+HkzqFcHA5oIPlcztdPte689QtMchhD/KM5
         ZvnCR768ysjg6tbZvKN6zs/qQ/0kPg24/10wPJT4PsfkBE19vMGGgVwBpIE1pX8T+n8u
         EqG5H/FmeI5rS2dRXMfvLSSsmcLN4xy7lY3Q3iYMNOrDjNzvpmxFUbjOqB51D21NR+Bv
         A9wNcSbM4FuaqWWTFtjoE8qPffjg8P5Qo+7q0cy1A54tZGw3rcwuLMtLwfJ6d0TEGmQm
         bXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xX6NnJBlZc5HyDgcExXc1+tZLWs5dKl2iDR8wStwjWU=;
        b=TDsQlLqZ16pk4SGo01gePa1VLGYf1yl51zaVsyN3lsq6/e/627HPd0541hi6QST1ij
         dnhiR2DLg09uaQPE2UWt7QzX0sc+dRc04ZnhUmYfI45CHF6B9ucim1PBSwGLqsU8tSjU
         RlqtFlvPJomBvZEWywRDWJjAfa4nYnNFU2n9ycz4RhCgEA7LlOVJKsOYIRDGTyXZWefF
         EyaxEuC/KsebcIPymcf6GO/bMsmpTZV598/7B5WMkWbdoYztlw3dXuFGOxPlQflCkC81
         v1TQyn5kSuxctjS9Y5AMUMd9yIoQRmkKZNLm7H4+3bzW/iNR2UrFCSb6pVHPoTtLPsii
         52dg==
X-Gm-Message-State: APjAAAWTKdCAV/L3yRb57PverphpD9fy9G6WXxi2WOMadrSh6Pde/NJl
        yeYR547zhr+JEcPEvsEpEcVNkq9QmLcp4kqodZbq5w==
X-Google-Smtp-Source: APXvYqwksNqEcTrnH+ZrQavgttKCKAjHSGreuaQWdmSfn4jOEMB3aEr+s+RPTyvo8LnLDVUaPK8Vc48/rizytJj4UfA=
X-Received: by 2002:a17:902:169:: with SMTP id 96mr10710000plb.297.1567100306938;
 Thu, 29 Aug 2019 10:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190827003709.26950-1-skhan@linuxfoundation.org> <f5088365-68a1-6036-0037-b6e9af01391f@kernel.org>
In-Reply-To: <f5088365-68a1-6036-0037-b6e9af01391f@kernel.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Thu, 29 Aug 2019 10:38:15 -0700
Message-ID: <CAFd5g44bYBjrp3XrUAmkDN5o-oD92G9GxVYnF6Y+2fLrodDTTA@mail.gmail.com>
Subject: Re: [PATCH v2] doc: kselftest: update for clarity on running
 kselftests in CI rings
To:     shuah <shuah@kernel.org>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dan.rue@linaro.org, anders.roxell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 28, 2019 at 12:18 PM shuah <shuah@kernel.org> wrote:
>
> On 8/26/19 6:37 PM, Shuah Khan wrote:
> > Update to add clarity and recommendations on running newer kselftests
> > on older kernels vs. matching the kernel and kselftest revisions.
> >
> > The recommendation is "Match kernel revision and kselftest."
> >
> > Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> > ---
> > Changes since v1: Fixed "WARNING: Title underline too short."
>
> I have a few more changes and would like to make and send a v3 after
> the LPC's Testing and Fuzzing kselftest discussion.
>
> Holding off on this patch for now.

Is this just because you are busy, or because you expect what you want
to say to change after the discussion?

If it is because you expect what you want to say here to change, I am
surprised. This seems like pretty good, straightforward advice. From
where I stand this seems like it makes the documentation better
without making anything worse, and so this change should probably be
included.

In anycase, your call. I just don't think anyone is going to dispute
what you are saying here :-)

Cheers!
