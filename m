Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08DAD1AAB6D
	for <lists+linux-doc@lfdr.de>; Wed, 15 Apr 2020 17:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389619AbgDOPI4 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 15 Apr 2020 11:08:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726403AbgDOPIy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Apr 2020 11:08:54 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CAACC061A0C
        for <linux-doc@vger.kernel.org>; Wed, 15 Apr 2020 08:08:54 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id z90so13430844qtd.10
        for <linux-doc@vger.kernel.org>; Wed, 15 Apr 2020 08:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs-cmu-edu.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zHjgRngcxp4AR6+D17yxXUy7WIPm1jT5Q+rQhvyf/FI=;
        b=y9GjytsKMQ+oZy9UDO8XhfI+uLUyDw62L1UOqN6vu0FAUq2jz4NHihuZ1/7E8ytw0d
         1VeWL14WK7i2JrRkh4SiL6o/aVMCWcK0rbFoACNEm1faH7Ahf79eigNpdjdf4Z1jD9l9
         SdC+Kv1inHJt9ezk7CoRk+1x6+tlM//a+CnW35QeeeAa+8gRNNFs1kJA5FB1CqqP7/JQ
         QXPB69NxwbKdwQmBrUJJYtDE1uWaAF8DUxQ/e3RxECjGvKa7Oay18MUamu2cRDE0tcl4
         pZWO4vPILwfeZpYbeL5uTut1JiVoczQOPe61MN+bGE+D5Y6Li83xINxWzprCwTOlsDyM
         RVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zHjgRngcxp4AR6+D17yxXUy7WIPm1jT5Q+rQhvyf/FI=;
        b=Xp5lcr+paknyedeWv7q2N/Mo7Isk8jbmgo5eEzW4DIkq9X3o3Zu+5MeFUNDFkY0yW2
         Ii4EhPciGKb5bydgwxrvxzF+CD3ztinE5A5X/aujWOXPT018zdeTzfC3H23n+C3j8GhI
         ans2etSV11zCm5F3ezj4xY56Noqg4IvYQFNAqa/2CpAioXnAkw3DbjRPbBgTxWyuCW2v
         qecODazyZXHqGQXd9RBaZf2L/nvta0+YXVY5rSlGadE2S2K//WtRZQCLIg349Ksdrt3t
         ox+Bij9+jui2dwXh0DfuLYjb/pR9sWPfVf0ST0Fmz7ez6Zx89b5x8kepbYDdgizzvWkb
         hkbg==
X-Gm-Message-State: AGi0PubFhlD2XqdvRQvAZ87f54x3jOZmJmjsUGfI74zO6q5HHqkFiSq8
        yMjhXoDtzujbcq/LMSLQp02tHQ==
X-Google-Smtp-Source: APiQypKBqVse0i/useuOKX9XIPZQeNQaGGpsDVaFjEJEOygDSozZAzhTK3chUTvgoREaBZJYXKbWrA==
X-Received: by 2002:ac8:4e2c:: with SMTP id d12mr1849346qtw.204.1586963333213;
        Wed, 15 Apr 2020 08:08:53 -0700 (PDT)
Received: from cs.cmu.edu (tunnel29655-pt.tunnel.tserv13.ash1.ipv6.he.net. [2001:470:7:582::2])
        by smtp.gmail.com with ESMTPSA id i6sm11541894qkk.123.2020.04.15.08.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 08:08:51 -0700 (PDT)
Date:   Wed, 15 Apr 2020 11:08:49 -0400
From:   Jan Harkes <jaharkes@cs.cmu.edu>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 11/34] docs: filesystems: convert coda.txt to ReST
Message-ID: <20200415150849.6vvcka4dxenpwbe3@cs.cmu.edu>
References: <cover.1586960617.git.mchehab+huawei@kernel.org>
 <e3dd3b8835e132090cb82d0acda1947c8bacf156.1586960617.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3dd3b8835e132090cb82d0acda1947c8bacf156.1586960617.git.mchehab+huawei@kernel.org>
User-Agent: NeoMutt/20180716
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 15, 2020 at 10:39:25AM -0400, Mauro Carvalho Chehab wrote:
> This document has its own style. It seems to be print output
> for the old matrixial printers where backspace were used to
> do double prints.

Ha, yes the original was probably generated with something like
troff/nroff.

> For the conversion, I used several regex expressions to get
> rid of some weird stuff. The patch also does almost all possible
> conversions in order to get a nice output document, while keeping
> it readable/editable as is:
 
Looks good to me.

Jan

