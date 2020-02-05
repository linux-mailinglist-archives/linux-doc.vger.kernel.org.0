Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE27152511
	for <lists+linux-doc@lfdr.de>; Wed,  5 Feb 2020 04:05:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgBEDFQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 Feb 2020 22:05:16 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40732 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727887AbgBEDFP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Feb 2020 22:05:15 -0500
Received: by mail-lf1-f68.google.com with SMTP id c23so362333lfi.7
        for <linux-doc@vger.kernel.org>; Tue, 04 Feb 2020 19:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5WF1go+DuJvbwgdXeUhoD65NaX1JQ7zRHimo51GmC8M=;
        b=a/rT7owEo3U/lPRFn35JOyHmNdZNKq3CUN5eC0vmSOAlGMUJJc7ELCvSX1Mh8APfaa
         lAlLVERWXR5pYN81ddhMclRnb/OmN5Fx2KddB7KuZLDfFPyFM3c5qNNCCjwGgxr+r3s1
         DNCcaZvM6VYKACKmTz/OjiTlKJVFN9VL8YzEYvQS2U83lFvZUm1XWKOklUIkQxQvXozG
         vNU7Zo1syf0hTTILG3oFQfUcj+JQqVr59fj+c5MCVuSCuEvLrPxTFeYRhYsiMU1wniYS
         k/ew5rFlhFL2LzMHulEuIV3u33upCBPfLhXENQXAIsbZYUZT2I99yQmfa/FkquxeDAIP
         aNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5WF1go+DuJvbwgdXeUhoD65NaX1JQ7zRHimo51GmC8M=;
        b=OIFLerk2R9uH+T+gKu8JOLHV3jtFpTxgBbiHLEj0DxF93cCwPrvbRqgBxyqunk9Gu6
         iq+8+uPPE5rT2cI/kC0sPGzy6xhLumWO608JXqWyCCThyVt4nxFZ0ovRZgWT8SO+ukO6
         Xfih4o46OHpfxeJoSGmxDkpFOJNwKsGVaVfm5i2JSw0ZwTx8/Vk7mOo7z39KKe3+V+oh
         eFam9eqlk9xCvHT/YcwhIEAUy46C9Y01klpIgmiHNGn7siQBiX2KJVikBQXGic/Ag8/L
         /L4GIIhmjc3OLagPdGNe5AYTK215yPxtTacw9Dve3bCT9JlrVuI8lg7go3A6qxecm29Z
         1yag==
X-Gm-Message-State: APjAAAUylVmWjQaiw2T0d53boLRKOC+8Lo/x7ECzMEp2mGC7Aj/LEW75
        wW0CznOY+DZpAFfMagaLLYEvfv+Dihbo6FnY7RMTnA==
X-Google-Smtp-Source: APXvYqzeG4caRRvcRllow4EA73MGmU6WFhFNYJbaTAD8sJamhzsXSFSCQuZUYpZgWEJovRgzDpyi7R9sxFKJltzNJtg=
X-Received: by 2002:a19:4a92:: with SMTP id x140mr17094713lfa.29.1580871913677;
 Tue, 04 Feb 2020 19:05:13 -0800 (PST)
MIME-Version: 1.0
References: <20200128230328.183524-1-drosen@google.com> <20200128230328.183524-2-drosen@google.com>
 <85sgjsxx2g.fsf@collabora.com>
In-Reply-To: <85sgjsxx2g.fsf@collabora.com>
From:   Daniel Rosenberg <drosen@google.com>
Date:   Tue, 4 Feb 2020 19:05:02 -0800
Message-ID: <CA+PiJmS3kbK8220QaccP5jJ7dSf4xv3UrStQvLskAtCN+=vG_A@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] unicode: Add standard casefolded d_ops
To:     Gabriel Krisman Bertazi <krisman@collabora.com>
Cc:     "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org,
        Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
        linux-f2fs-devel@lists.sourceforge.net,
        Eric Biggers <ebiggers@kernel.org>,
        linux-fscrypt@vger.kernel.org,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Richard Weinberger <richard@nod.at>,
        linux-mtd@lists.infradead.org,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Feb 2, 2020 at 5:46 PM Gabriel Krisman Bertazi
<krisman@collabora.com> wrote:
>
>
> I don't think fs/unicode is the right place for these very specific
> filesystem functions, just because they happen to use unicode.  It is an
> encoding library, it doesn't care about dentries, nor should know how to
> handle them.  It exposes a simple api to manipulate and convert utf8 strings.
>
> I saw change was after the desire to not have these functions polluting
> the VFS hot path, but that has nothing to do with placing them here.
>
> Would libfs be better?  or a casefolding library in fs/casefold.c?
>
>
> --
> Gabriel Krisman Bertazi

The hash function needs access to utf8ncursor, but apart from that,
libfs would make sense. utf8ncursor is the only reason I have them
here. How do you feel about exposing utf8cursor or something similar?
