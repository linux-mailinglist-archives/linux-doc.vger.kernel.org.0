Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 355FA10DFF0
	for <lists+linux-doc@lfdr.de>; Sun,  1 Dec 2019 01:40:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbfLAAk4 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 30 Nov 2019 19:40:56 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33456 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726188AbfLAAk4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 30 Nov 2019 19:40:56 -0500
Received: by mail-lj1-f193.google.com with SMTP id 21so4149540ljr.0
        for <linux-doc@vger.kernel.org>; Sat, 30 Nov 2019 16:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D5KsBUM8JPybDXiUpn5VQxvK/h7+Y2vajWRzHP60FL4=;
        b=bMO4gHAAReaAa9vawpWAqbJqwziS8m4F59UGT7LFZBRbuY/+ZXOd6zXE2VmTjpeFcD
         csNKArPGBeAixXoAgRRYNBjq0OZWH8+6jfBXW7dOuLt6okhMcuEOB2bJYnPup02YSO52
         qAJhlQ10rVZXIue3kNBcXrCAzqLxtniIcRGPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D5KsBUM8JPybDXiUpn5VQxvK/h7+Y2vajWRzHP60FL4=;
        b=j4BZbZfYVvwlZpfssiK5d9BSJFIOnVyj01ocnIx8lGPVRXplQF3d1gueuG462LZNVO
         9M2nrY7vSDgCm3IwXszgRH3Iq3XEn0R9+lN4YNMMBG62hCEzvSdYloq7Ff8S8zJlNd+0
         ShEYQ2qLmN/NV8/Ji2APDBRzA38F66T7ZgVxaw1cTxwm/i/RHKPQ1iimpZ2E6Bx1xa12
         agYB3lyq98H7T9NnDYs7NMSeQI8zaaSXXC2XvUr5HQiwdv2aB5b9msni5P0Wr0fBzZ/Q
         LNghEKBmDslaVMuBh2cZ0cz3FQI1eE0XSkWt43Ro0O96x0O4aI1DydiBI7TBDolIZKGt
         zVGg==
X-Gm-Message-State: APjAAAWgs15I1VuW/vGI6bF1N2ZKEPqqI+73d65pE8M8bfRAxnNUkvxv
        EHlrI+728UowTxD0tlR6E5Yz9G6W5oY=
X-Google-Smtp-Source: APXvYqzsB+WOXPVQVn7l6uwDXafJJM1nqtczXitIxHCVywoOmrgT7C5+hf0YtmBf3QBhGJIT4mglSQ==
X-Received: by 2002:a05:651c:111a:: with SMTP id d26mr41583639ljo.168.1575160853431;
        Sat, 30 Nov 2019 16:40:53 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id a27sm4008567lfo.38.2019.11.30.16.40.52
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Nov 2019 16:40:52 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id k8so25241206ljh.5
        for <linux-doc@vger.kernel.org>; Sat, 30 Nov 2019 16:40:52 -0800 (PST)
X-Received: by 2002:a2e:86c4:: with SMTP id n4mr27980802ljj.97.1575160851969;
 Sat, 30 Nov 2019 16:40:51 -0800 (PST)
MIME-Version: 1.0
References: <20191126093002.06ece6dd@lwn.net> <CAHk-=whH-wrF7dx_+NgpYi8pK0vovE2mEFE3sgEYXAQZcPwBjA@mail.gmail.com>
 <20191130171428.6c09f892@lwn.net>
In-Reply-To: <20191130171428.6c09f892@lwn.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 30 Nov 2019 16:40:35 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjrRu1BB+GRXn+k2oEWZHm03p19MnQqbSfgn=mMiWnCkQ@mail.gmail.com>
Message-ID: <CAHk-=wjrRu1BB+GRXn+k2oEWZHm03p19MnQqbSfgn=mMiWnCkQ@mail.gmail.com>
Subject: Re: [PULL] Documentation for 5.5
To:     Jonathan Corbet <corbet@lwn.net>,
        Git List Mailing <git@vger.kernel.org>,
        Junio Hamano C <junio@pobox.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

[ Background for Junio and the git mailing list - Jon's pull request
to me had a lot of whitespace damage from CRLF line endings for some
of the patches he applied. ]

On Sat, Nov 30, 2019 at 4:14 PM Jonathan Corbet <corbet@lwn.net> wrote:
>
> So my tooling is "git am", nothing special.
>
> All of the afflicted files arrived in that state as the result of a pair
> of patches from Jonathan (copied); I have verified that the original
> patches also had the DOS line endings.
>
> The problem repeats if I apply those patches now, even if I add an
> explicit "--no-keep-cr" to the "git am" command line.  It seems like maybe
> my version of git is somehow broken?  I have git-2.21.0-1.fc30.x86_64,
> FWIW.

Hmm. I wonder if the CRLF removal is broken in general, or if the
emails are somehow unusual (patches in attachments or MIME-encoded or
something)? Maybe the CRLF was removed from the envelope email lines,
but if the patch is then decoded from an attachment or something it's
not removed again from there?

Can you attach (not forward) one of the (raw) emails that shows the
problem and keep the git mailing list cc'd?

             Linus
