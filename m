Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B38519A237
	for <lists+linux-doc@lfdr.de>; Wed,  1 Apr 2020 01:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731362AbgCaXDz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 31 Mar 2020 19:03:55 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:39226 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730589AbgCaXDz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Mar 2020 19:03:55 -0400
Received: by mail-qk1-f196.google.com with SMTP id b62so25111565qkf.6
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2020 16:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=massaru-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=6+Ad8chN8N6NC/ANcuSXXfqOAu/A2JYw1wt09IvHLHk=;
        b=BYPoPlZDMsKi0FSqwT7J8j6e3ZsLsoLTc7e6bIfOvF8i9JfwL7ujted9TDYKSoyCEL
         wss6qyMAAdamEMvjPT/2XG2iacb18LUIARFADHbjQeX9VksO5PqLSbZxbeT06uYN98YF
         4BQopInUjf1ZuGBvv67W/pnS8xy0ztTGyLBWHG33iRK7T52eSeT0vLLjb4bHx9tz2K1J
         qjaQDPDGP9cY7gIqyqz+kGRc8cwjYbjNXKXVcTnXfqmRAg7b9DPF6suxl4WF3fau28jE
         MKGMYopKmx6oqV5ILGl6MO0TDuf9+ewPUKiOVbP6bhHhx5z4ZJtytn/nREN/UCOMjdRj
         jZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6+Ad8chN8N6NC/ANcuSXXfqOAu/A2JYw1wt09IvHLHk=;
        b=IaGmW04cHfsN1OfnWiOC+yp1khXJkJOnJFoGIaP8+Y6cBgCQmLJNP0+G6AeOg2HrPx
         Enfrw2TkMc5pN4iyz+YkmyHXFA01RR6MUQaCIAn+obblTH0mtWdTqbYkhBuhLEhZc65i
         8Girc9r72ZfcR6TucZuP1NqsMFgHgQkBrkqfkT0yhzRIBSQLSDTqjSBVWORyU9jSx1KD
         D0aZya+5Qo7WTl8/WxGSaEr4y6gsbr1fTBfA0U8PvPBsWldTuPfmPUdRtWwoyT+UVuAR
         rzgDWUXBNRyrDgjI3OQzxPVKGF1/DiA3SAHVH13rh8LNTOtQK1TkQdsTqN0mQ4IGid5m
         OUrQ==
X-Gm-Message-State: ANhLgQ1Cy6LRAGFVhoaocsQSF0GuAr7Yy2Md0sBesz54hMwvAtO2PYOr
        2hk/RCEPmPPiwr8qgNem+IfWCA==
X-Google-Smtp-Source: ADFU+vvgq8KvtHWzopj9WKZIu9UuPfUEJEUwl8GnN31YdGOfnI2WhbAP2wY/viaa+nxTOMOBd1yfgw==
X-Received: by 2002:ae9:dd85:: with SMTP id r127mr6295575qkf.58.1585695832139;
        Tue, 31 Mar 2020 16:03:52 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
        by smtp.gmail.com with ESMTPSA id j39sm228345qtk.96.2020.03.31.16.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 16:03:51 -0700 (PDT)
Message-ID: <6db0b1a2a521386613489443053a980621c48767.camel@massaru.org>
Subject: Re: [PATCH 1/2] Documentation: filesystems: Convert sysfs-pci to
 ReST
From:   Vitor Massaru Iha <vitor@massaru.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        brendanhiggins@google.com, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Date:   Tue, 31 Mar 2020 20:03:46 -0300
In-Reply-To: <20200331165707.7c708646@lwn.net>
References: <cover.1585693146.git.vitor@massaru.org>
         <637c0379a76fcf4eb6cdde0de3cc727203fd942f.1585693146.git.vitor@massaru.org>
         <20200331165707.7c708646@lwn.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 2020-03-31 at 16:57 -0600, Jonathan Corbet wrote:
> On Tue, 31 Mar 2020 19:28:56 -0300
> Vitor Massaru Iha <vitor@massaru.org> wrote:
> 
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > ---
> >  .../{sysfs-pci.txt => sysfs-pci.rst}          | 40 ++++++++++-----
> > ----
> >  1 file changed, 22 insertions(+), 18 deletions(-)
> >  rename Documentation/filesystems/{sysfs-pci.txt => sysfs-pci.rst}
> > (82%)
> 
> Please supply a changelog with your patches.
> 
> The conversion you have done in this file is incomplete; I suspect
> that
> you have not actually built the docs and seen what the results look
> like.
> There are literal blocks that you have not marked as such, as a
> minimum.
> Please actually do a docs build (after adding this file to index.rst)
> and
> make sure that the output is what you intended.
> 
> One other thing of note...this file dates back to before the Git era,
> and
> while it has seen numerous tweaks since then, it's clearly
> outdated.  Look
> at what's actually under /sys/devices/pci* compared to what's
> documented.
> I will take the conversion without it, but what I would really like
> to see
> would be an effort to document all of the attributes that appear
> there
> with current kernels.
> 
> Thanks,
> 
> jon

Thanks for the review, I will check your comments and correct themif that document is still needed.

BR,
Vitor

