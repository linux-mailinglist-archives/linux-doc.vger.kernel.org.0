Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBDD153C05
	for <lists+linux-doc@lfdr.de>; Thu,  6 Feb 2020 00:40:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727482AbgBEXk0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 5 Feb 2020 18:40:26 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35609 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727392AbgBEXk0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Feb 2020 18:40:26 -0500
Received: by mail-lf1-f68.google.com with SMTP id z18so2777430lfe.2
        for <linux-doc@vger.kernel.org>; Wed, 05 Feb 2020 15:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eImnorc+E72Ebn4XEF1SUg6cxpdpF8frzXw7k6RoRcE=;
        b=Eucncfy0bfw2XSNvy3spLaCcbAJQXGXLfKwBFip2IDIQLXmUo0Oshd2FbgLS3FZnZK
         9niWI9xMAjS7AulP2kZjWHny2XgDM4S//hdCeWXKGIFCEUzBUo9M1OOddK2Eg26bMsyB
         DveOA8IJDdhnBk9uzpiAv8bDzUzDwCELfF16cn3TKe90OqY8nddNTeRzv5gtlrc0uFPh
         ptbM+AfLEnnLiVD9BHUxlxFOKknvZ/WKsce5pwcjNl6ABhJJ2svy6h+x4B1RvPJIsTC1
         B661E2LWjz74WjBpodNkt6YPeBFT46XbVetSnJ+7xHdI0sIyKm27coJnchHIyhuRidtM
         TUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eImnorc+E72Ebn4XEF1SUg6cxpdpF8frzXw7k6RoRcE=;
        b=AN+6lroNHE6WBv2tpGXJcGMgDLVUjxc+LY8BQ1QMbkar1KeHG582XgN/LUJxWTHN1B
         VBRGBIfJMhvB7pYAUZkndEpssXLCgY7cIElQ4Yu76e1oQAkbbUzEEDsOCIJte26/7knJ
         o3UgeayWqOChRVlYtGBsVUMDARIn+T+PI0qEFv9PHmEElEqS/8zoNaWlPS3e/E0EfszV
         vMQJcYVGmbyu7yr8O6+mtYmEzqEwUuUx6E/CbmYj1OeR6Sdpz8ArSPfZ4lQB9DDkv89f
         qtaqS1ckqQr2bpUKzH/aH6RGkRk0CwN6XN7CSm6ZYuc7OYQix7j60nX1FguqhxmL+gSO
         o8ZA==
X-Gm-Message-State: APjAAAUvTf5m3iytY63IuLbvzDP2cmhjSvHm1W9QzzuSZsIolaG+2D07
        qqptNB/UmYeRrYeRozieUANFS8eXqq8Fc0AWEaD5cQJNWso=
X-Google-Smtp-Source: APXvYqzzEBWngyKstrRaijt7X7I5bXY9Val+Hxs5gu/BwpxZpiBbhMGiFic8G5pM6rS0i/mpmGgwfAohfvUcJsRyKVQ=
X-Received: by 2002:ac2:5979:: with SMTP id h25mr122207lfp.203.1580946023798;
 Wed, 05 Feb 2020 15:40:23 -0800 (PST)
MIME-Version: 1.0
References: <20200128230328.183524-1-drosen@google.com> <20200128230328.183524-2-drosen@google.com>
 <85sgjsxx2g.fsf@collabora.com> <CA+PiJmS3kbK8220QaccP5jJ7dSf4xv3UrStQvLskAtCN+=vG_A@mail.gmail.com>
 <85h8051x6a.fsf@collabora.com>
In-Reply-To: <85h8051x6a.fsf@collabora.com>
From:   Daniel Rosenberg <drosen@google.com>
Date:   Wed, 5 Feb 2020 15:40:11 -0800
Message-ID: <CA+PiJmQgFNLYoRu7fSWgz_He8Z8ceq1G2yUDcy0OCn1iD2rkzA@mail.gmail.com>
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

On Tue, Feb 4, 2020 at 8:21 PM Gabriel Krisman Bertazi
<krisman@collabora.com> wrote:
>
> Daniel Rosenberg <drosen@google.com> writes:
>
> Hi,
>
> It was designed to be an internal thing, but I'm ok with exposing it.
>
> --
> Gabriel Krisman Bertazi

We could also avoid exposing it by creating an iterator function that
accepts a context struct with some actor function pointer, similar to
iterate_dir. I'm currently reworking around that and moving the fs
specific functions to libfs. I can move the generic op_set code there
as well.

-Daniel Rosenberg
