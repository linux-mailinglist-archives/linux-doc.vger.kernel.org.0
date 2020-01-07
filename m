Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2074F132DDD
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jan 2020 19:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728640AbgAGSAb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 7 Jan 2020 13:00:31 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41129 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728638AbgAGSAb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Jan 2020 13:00:31 -0500
Received: by mail-lj1-f193.google.com with SMTP id h23so485527ljc.8
        for <linux-doc@vger.kernel.org>; Tue, 07 Jan 2020 10:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oJmb1LPtGlsUIbaPpyHrumTKVXFFE8HlB/tf6eTEZcU=;
        b=1t/J2mZzafDYbWuTv41UUD5NfzZLBqOZbagzyGc06XsuE1sAIjDK7M3C+rVJAx4JhN
         XWEhBwoO5zpxAGdKSXr2psmV4XjOy3dlh4oBM/Wuj7VPHQ5kaDOBKMaPcjlZmTMtCKVy
         NRdf5i2NvgPqIVJJ5tvExbOLDVRsyZShGvI4PrbZWceAyK08o85Pi79LymfyWj6figtG
         5QYJrjjlsxvExtR1uZRbUepiHGkPNFgMKJMZ3C6H8dT1XnkXtcu5zZAvQDPLb0hZy+ae
         GamdWoRMtg+GvSt50q/WoT04cobzNe3l5kihnyDSRge38IkgkGn4H1lHKNqNWqFMBFGu
         /x2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oJmb1LPtGlsUIbaPpyHrumTKVXFFE8HlB/tf6eTEZcU=;
        b=e47bPoL6cpYjwII0cNIYfUOTcRCL0tDiFHsSYF9JliDk58MHO52h/WdAjoG8w7kzhH
         lNQzLJfNZ1RmjWibET8Oo7iiIDYquhgJulNqimb5Wp+0FnCLeo/2jgpNUhCNFSeNSJ7M
         Aw65Gk+MvQ3ftyW/6CUXb+AqqDolUBM7zbZHN7JlhAZzYk9YqmLbizjuadSjMiRwC2nA
         8wmJHIdBBYCun+H8eCyGSpoeOhqqB73MkaOV/Ed6TsSY3v7FerrjCKApg9SXinZjM95l
         7SYhm1KU/DNh9elM709s5GAEJuh5SZl/yefdpIPy6G8PVVFNikpRs+BXBJMny1d2J7vs
         HXRw==
X-Gm-Message-State: APjAAAWucPBpUVC5YmZzwu+wNnXRFardWq9CmlLBLFqYUWhbU/Y7isu4
        2YCh956rrKOV31fzdWz8ytyVZCptFRZalcitGaNU
X-Google-Smtp-Source: APXvYqz/AHViVwt1HtM3LgJ7uTjgXPG6t8RJmQgcPQu/FxhT5MudxLwLxoFROgyW/yHVOUZNkQFw4uaWkDvw7IfWWlk=
X-Received: by 2002:a2e:800b:: with SMTP id j11mr389528ljg.126.1578420029415;
 Tue, 07 Jan 2020 10:00:29 -0800 (PST)
MIME-Version: 1.0
References: <20200107163504.29769-1-sds@tycho.nsa.gov>
In-Reply-To: <20200107163504.29769-1-sds@tycho.nsa.gov>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 7 Jan 2020 13:00:17 -0500
Message-ID: <CAHC9VhSyKAunHH3EhgjBpkahrwh=a5W_TJFmJY3p=pigwENOkg@mail.gmail.com>
Subject: Re: [PATCH] Documentation,selinux: fix references to old selinuxfs
 mount point
To:     Stephen Smalley <sds@tycho.nsa.gov>
Cc:     selinux@vger.kernel.org, omosnace@redhat.com, corbet@lwn.net,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 7, 2020 at 11:34 AM Stephen Smalley <sds@tycho.nsa.gov> wrote:
>
> selinuxfs was originally mounted on /selinux, and various docs and
> kconfig help texts referred to nodes under it.  In Linux 3.0,
> /sys/fs/selinux was introduced as the preferred mount point for selinuxfs.
> Fix all the old references to /selinux/ to /sys/fs/selinux/.
> While we are there, update the description of the selinux boot parameter
> to reflect the fact that the default value is always 1 since
> commit be6ec88f41ba94 ("selinux: Remove SECURITY_SELINUX_BOOTPARAM_VALUE")
> and drop discussion of runtime disable since it is deprecated.
>
> Signed-off-by: Stephen Smalley <sds@tycho.nsa.gov>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 9 ++++-----
>  security/selinux/Kconfig                        | 7 ++++---
>  2 files changed, 8 insertions(+), 8 deletions(-)

Merged into selinux/next, thanks.

-- 
paul moore
www.paul-moore.com
