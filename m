Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6E451DC1A2
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2020 23:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728046AbgETVxr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 20 May 2020 17:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727947AbgETVxr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 May 2020 17:53:47 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39C5AC061A0E
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2020 14:53:47 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id m64so3928428qtd.4
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2020 14:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mail-followup-to:mime-version
         :content-disposition;
        bh=KKBVTkKhUHA+8K4mFlQfTbdABv1FxHywVbPhVoIcdf0=;
        b=eOIChopKstaJ5IYRBgZB5p1r/yy7FwLlGSYzLfMEs/JlWa4LxH/l5vjMK/COM8pgCh
         bVxPKlYzFZ+4dlJDvK2s+fLfvIAzqYxhXVAnRphxRlcZvBDWiUZzdnuUugtj9LHrPywp
         4lyXvOm9zdmxfeTMfFsDcpQIpQcIow9bX6wJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
         :mime-version:content-disposition;
        bh=KKBVTkKhUHA+8K4mFlQfTbdABv1FxHywVbPhVoIcdf0=;
        b=QEDmIssMuuIwD7f0WP4NQF+bflsi9loki8T5ncUxtIk5V10LCJLxQNg2UrvOkcrdQV
         +9NXPFX2oPHmH8Brg6d/b4AA0A6yFb5BK2zFAzL25DtoLL02jSwjI5C8bdkB0fdTFqwr
         9F/2iTKQxMi+jOimC/N6jC8bjfZmCcR9hqbAQUF3gA8MnfFHIryND4ZAmwLzDV6fB1vO
         uKx/gjPdk3vOZSHNLoASY7ESJFGBgar320CJEcDOAHfxKZP+j4dqX3l/jtgCMMbTBjUm
         aoBHu82LIPq7TCfBhShDT8thjlR0vqu6RhWuw4Qok/JZC0tSBLXaNLpjTgj4fM3GVsC0
         jD8g==
X-Gm-Message-State: AOAM532XxArNaqBog0ULO7anQ9oJg2vmNsnC2DJ6mNw4Umv07ijq4frI
        GJmfQeGuWr1kq11SLmAuClyuGS3Btvw=
X-Google-Smtp-Source: ABdhPJxq1+fYI4tqnIWD+hvCbuJ00sGShLLp4/YKPfU39aIxdkCWNARtXbFce75Gv2+htgE7Hn7VGw==
X-Received: by 2002:aed:3907:: with SMTP id l7mr8074551qte.62.1590011625973;
        Wed, 20 May 2020 14:53:45 -0700 (PDT)
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id p42sm3607379qtk.94.2020.05.20.14.53.44
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 14:53:45 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Wed, 20 May 2020 17:53:43 -0400
Date:   Wed, 20 May 2020 17:53:43 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     linux-doc@vger.kernel.org
Subject: Building directly with sphinx
Message-ID: <20200520215343.btkr7avo3ruu2iap@chatter.i7.local>
Mail-Followup-To: linux-doc@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi, all:

I was playing around with readthedocs.org recently and wanted to see if 
I could build kernel docs there. I cannot directly run "make htmldocs" 
there, and it proved to be quite tricky to make sphinx do the right 
thing without all the things that are being defined in the Makefile.

Is it possible at all, or am I wasting my time?

-K
