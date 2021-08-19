Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C71B3F105D
	for <lists+linux-doc@lfdr.de>; Thu, 19 Aug 2021 04:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235729AbhHSCa5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 18 Aug 2021 22:30:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235686AbhHSCa4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Aug 2021 22:30:56 -0400
Received: from mail-vs1-xe62.google.com (mail-vs1-xe62.google.com [IPv6:2607:f8b0:4864:20::e62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 162C7C0613D9
        for <linux-doc@vger.kernel.org>; Wed, 18 Aug 2021 19:30:21 -0700 (PDT)
Received: by mail-vs1-xe62.google.com with SMTP id b5so3127520vsq.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Aug 2021 19:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:dkim-signature:from:to:cc:subject:date
         :message-id:content-transfer-encoding;
        bh=pqboTJCcAOfo09rbB71PF8zWvy4otzTvc+THnflfZow=;
        b=KptBz0DlS92Wib0oW1jzR5hSNPNOHASXUGmhYz8O1x8Nj8aNJ+4bx5McATKNIPiacA
         Q9CxRsqQu0/ytZNQQCti05KJEiYFZYu2ltEwmkWnNBUFGOxIKk7fj/sG27Mvvu1fwTBj
         HXBo8yVc3m54jKP9qZOwYbmp9b1eaZj1jHcM0P2DNmys7ltGDy0Ps72MoPYTC3GIzlf/
         VbPUOX9U0H6VYII8XWC8e3Q2S9Snq4YcjVGY19MhpVbOMtBslYNvjyLvFh3I/rOcUKB/
         Uh8/3nfbTlFq4pzuv8gkccJexYfbmwLAyrH0U2efKxV4R5JhX+LTUnIQ0pBye54doyD5
         qAuw==
X-Gm-Message-State: AOAM530nqO4oARRvmAQSSg1Ua9Z5NTjO8clmsqcUIyQWsKP4/cYWvRik
        AzkYodpXo9DyiQSJbXGapJ04vjyAVFqPzId0MO433DB933fK
X-Google-Smtp-Source: ABdhPJzQ6jgObdXjtEO3ZjgEbcgu59O2EIq8CFX2YU++F2dMAZP465I7ZnniqR4it0bPZaFbuyztQzcfldMi
X-Received: by 2002:a67:6704:: with SMTP id b4mr10727566vsc.6.1629340220051;
        Wed, 18 Aug 2021 19:30:20 -0700 (PDT)
Received: from smtp.aristanetworks.com (smtp.aristanetworks.com. [52.0.43.43])
        by smtp-relay.gmail.com with ESMTPS id g15sm427225uam.2.2021.08.18.19.30.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Aug 2021 19:30:20 -0700 (PDT)
X-Relaying-Domain: arista.com
Received: from chmeee (unknown [10.95.69.61])
        by smtp.aristanetworks.com (Postfix) with ESMTPS id 74B7F30031F7;
        Wed, 18 Aug 2021 19:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arista.com;
        s=Arista-A; t=1629340218;
        bh=pqboTJCcAOfo09rbB71PF8zWvy4otzTvc+THnflfZow=;
        h=From:To:Cc:Subject:Date:From;
        b=GzmSurSBdHLzTKClk0fzGjZP3Xm3sXzOcxHxp4OzuABBjL/QHClO1jxG+6qhFwOUM
         FAOS14JfOZCmBOziHJZ6kfmslrn4NeKrL2hOWCXtnObfXT80TW3lk0SRM74p+Idf6+
         vfKHrPWeSkqJR9CVv1USn0wPcicFny9pm/Wp5zbwsI8A77WZaNB0cr11wyQxFRz5y4
         Zmy3NqgWYeu0LLWmFEsSHNwqlAejg+03gbNapYxe7LbYuafCIWW6fgh/OnJZ7Y07F+
         0pdQhG/qZJWvTUJkoZF2x1v9imdBBWZn3osGjiQvCjG5R3Ca6yA36GWTHJerI6br7t
         bnw/oXFx2GY5A==
Received: from kevmitch by chmeee with local (Exim 4.94.2)
        (envelope-from <kevmitch@chmeee>)
        id 1mGXot-002MCU-Tt; Wed, 18 Aug 2021 19:30:15 -0700
From:   Kevin Mitchell <kevmitch@arista.com>
Cc:     linux-scsi@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hannes Reinecke <hare@suse.de>,
        Bart Van Assche <bvanassche@acm.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] lkdtm: update block layer crashpoints
Date:   Wed, 18 Aug 2021 19:29:38 -0700
Message-Id: <20210819022940.561875-1-kevmitch@arista.com>
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is v2 of https://lkml.org/lkml/2021/8/16/1497.

These patches update the lkdtm crashpoints in the block layer that have been
moved or removed.  In response to feedback, I've renamed the SCSI_DISPATCH_CMD
crashpoint to SCSI_QUEUE_RQ to correspond to the new function that it hooks
into. I have also added a commit to remove IDE_CORE_CP.


