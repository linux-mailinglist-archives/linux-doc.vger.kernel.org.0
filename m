Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5501E1C6412
	for <lists+linux-doc@lfdr.de>; Wed,  6 May 2020 00:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729170AbgEEWoI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 5 May 2020 18:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbgEEWoH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 May 2020 18:44:07 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8217EC061A10
        for <linux-doc@vger.kernel.org>; Tue,  5 May 2020 15:44:07 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id fb4so118317qvb.7
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2020 15:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=massaru-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=C76LIzi+5JEntbZy/qpJ0FbBUCkVF2NVl+l3fJXGdsQ=;
        b=oiObcX6jBSeqxuVh18DxaP4VKpyAStp5GGdizA7cYt7WmM6dWbuGQxBEL+VVoIUoDS
         ku8zmELuSS6v2qq/ewa5IGUmKfU1iJyBxNXu5tieOc9Fg7O/h6ARn4CbxdSx3sngwN7P
         EEXC+owDs1Gi0O0EncsKBljKwVT4X2TuPXsU1rFQgyxcqNF9LjhT02wYkxMfR8aUXww7
         p6+++CupbZ6LKHySeJgjAwRgwXZbB1Kin250GH4Raw+JGTZMtxqoUDIWW18Zst6JPlnq
         xpCTHnxhduEM9lWP+uY1GPfZ458TP3yzoWOnG3LUPTIbN+CX5FTJVLp25HD2Jh/Ebus7
         KYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=C76LIzi+5JEntbZy/qpJ0FbBUCkVF2NVl+l3fJXGdsQ=;
        b=TWgH+aYv568m79Ic44zXAOWA2qWHnrKbyrstpcKDqG2DYyb37NdZxmKOge7p9NvyJ5
         JIESfTyvL5MO9FI6u/qJZLR2dYgSBdji5O9YDvRDmySyH5/nXqZghNIwuqGHfFrBgCgK
         4sNh+Krt4Qab9XJtdDjGalH0mHsN2O9QcfxmZR/jQa/yTz75hEcxa2RQBJWedIw8Gi1m
         oSXZoKhOkdTlZyQAIFJjKtVj5dxGzftZbieaCceYSo5uU5qRS/QSWy9X+gQfjY+/ctQe
         TiaMjvChD9/9nIIinXpdvnjyjjI6omE+I2Y1zSqT6CIdfwFTzNSf3KknnXmLgKhXRQcL
         yxXQ==
X-Gm-Message-State: AGi0PuaLWaFHnPhOVVkN9y5NK9IwpqTFa+bHmJ2Xtb7MeZ2o8MPslM31
        Z3qTweCJcmQ7GbYqnOyhRK5h0w==
X-Google-Smtp-Source: APiQypLneX5+0+lcyzB0u8ws0ZzKSXPK5claKysblIbIb96NIdVrq1gVior7r/FubUDA45y7URkDvw==
X-Received: by 2002:ad4:55a5:: with SMTP id f5mr5000177qvx.133.1588718646066;
        Tue, 05 May 2020 15:44:06 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
        by smtp.gmail.com with ESMTPSA id u11sm3058126qtj.10.2020.05.05.15.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 15:44:05 -0700 (PDT)
Message-ID: <c092c2f7659d344744bd4400bccc2bb6f774b998.camel@massaru.org>
Subject: Re: [PATCH] docs: s390: Fix wrong label Guest2 instead of Guest3
From:   Vitor Massaru Iha <vitor@massaru.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, akrowiak@linux.ibm.com,
        pmorel@linux.ibm.com, pasic@linux.ibm.com,
        heiko.carstens@de.ibm.com, gor@linux.ibm.com,
        borntraeger@de.ibm.com, linux-kernel@vger.kernel.org,
        brendanhiggins@google.com, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Date:   Tue, 05 May 2020 19:44:01 -0300
In-Reply-To: <20200505094632.0d34f72b@lwn.net>
References: <20200430221238.101838-1-vitor@massaru.org>
         <20200505094632.0d34f72b@lwn.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 2020-05-05 at 09:46 -0600, Jonathan Corbet wrote:
> On Thu, 30 Apr 2020 19:12:38 -0300
> Vitor Massaru Iha <vitor@massaru.org> wrote:
> 
> > This fixes:
> > 
> > Documentation/s390/vfio-ap.rst:488: WARNING: duplicate label
> > s390/vfio-ap:guest2, other instance in
> > /home/iha/sdb/opensource/lkmp/linux_doc/Documentation/s390/vfio-
> > ap.rst
> > 
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > ---
> >  Documentation/s390/vfio-ap.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/s390/vfio-ap.rst
> > b/Documentation/s390/vfio-ap.rst
> > index b5c51f7c748d..367e27ec3c50 100644
> > --- a/Documentation/s390/vfio-ap.rst
> > +++ b/Documentation/s390/vfio-ap.rst
> > @@ -484,7 +484,7 @@ CARD.DOMAIN TYPE  MODE
> >  05.00ff     CEX5A Accelerator
> >  =========== ===== ============
> >  
> > -Guest2
> > +Guest3
> >  ------
> >  =========== ===== ============
> >  CARD.DOMAIN TYPE  MODE
> 
> Applied, thanks.
> 
> Note, though, that while the patch does "fix" the warning, what it
> really
> fixes is (as suggested in the subject) an incorrect heading; the
> warning
> was just a symptom.

Thanks Jon, I will be careful about that.
> 
> jon

