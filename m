Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1277E1543CE
	for <lists+linux-doc@lfdr.de>; Thu,  6 Feb 2020 13:12:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727764AbgBFMMH (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 6 Feb 2020 07:12:07 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:38251 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727609AbgBFMMG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Feb 2020 07:12:06 -0500
Received: by mail-io1-f65.google.com with SMTP id s24so6027558iog.5
        for <linux-doc@vger.kernel.org>; Thu, 06 Feb 2020 04:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+PFo107MqpbbZak5POBjNZ8ZnCLKs4Wt7KVl/7P0nms=;
        b=FgvG2cBIuhRKJYVrMa/jwc/mRGvUFzNfzs1L2dt7RKxcMe0F71IfHxnh1leuhq5e5J
         5D7npVeLlmQ1vg+FePwxEGtlslQ/Hwh5Uu013/3zR5G0nF3KxDVII++GDtUC5HbAOhgy
         lLPL/Qt547GWoblK22hLLNFIWU9B1EkzncNXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+PFo107MqpbbZak5POBjNZ8ZnCLKs4Wt7KVl/7P0nms=;
        b=EFMVGCcSpPzqSbfYFCtNX/Ew3uh71yIfiutgD6LVTCeZ4m9jR+vc2pfQndPY8FudoO
         qouTx+Oz4x1E7n+B8i6tS1Y2kM1LADLVuSpcl7SDAAiv/bWsBlJmQPwKaju40Op7xGTf
         8Iei4N4ZU/up/thGzupd7pU/pebFOZdUkMeDDui04QEBM8fXjIextrlr2vYm/Yd5lBaP
         1E0e4cLAqAE1yCm7PUTEAhp/QsMHrks61f3gEjU+88CaOUCghwbYUoQe+MZdfluW3uXs
         Uli1qtqxJPbrDWVBgj+gR2jbVhjCulCXg8ff1A/8YDai+69e5+2zNc5Ni7fZAsR/R3+0
         7MTA==
X-Gm-Message-State: APjAAAVqc2r8p0/MHkcLQLyT1qzj/uWcD4EguRWS2HI7DQDW6LBGsfIs
        vC1CQASfX8k/XkjPqOpw4eDIqaoZPLH/QUlvaPUGWg==
X-Google-Smtp-Source: APXvYqw+AafqWRMiNeMaK2ZzeSWCKa1a2AEyn5fU8XVpHAXFE2BlGUPEGrIU9uURygwuq1xiPd7p6YF9RY9131TQc3g=
X-Received: by 2002:a5d:9a05:: with SMTP id s5mr32229734iol.252.1580991124557;
 Thu, 06 Feb 2020 04:12:04 -0800 (PST)
MIME-Version: 1.0
References: <20200129050621.700256-1-dwlsalmeida@gmail.com>
In-Reply-To: <20200129050621.700256-1-dwlsalmeida@gmail.com>
From:   Miklos Szeredi <miklos@szeredi.hu>
Date:   Thu, 6 Feb 2020 13:11:53 +0100
Message-ID: <CAJfpegsBHEBX8D2Eyybxmg5XWWyALA5VpFYVT+Ov=gYKx2PvGQ@mail.gmail.com>
Subject: Re: [PATCH v5] Documentation: filesystems: convert fuse to RST
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, mchehab+samsung@kernel.org,
        markus.heiser@darmarit.de, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 29, 2020 at 6:06 AM Daniel W. S. Almeida
<dwlsalmeida@gmail.com> wrote:
>
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
>
> Converts fuse.txt to reStructuredText format, improving the presentation
> without changing much of the underlying content.
>
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

Thanks, applied.

Miklos
