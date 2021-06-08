Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9E33A05EE
	for <lists+linux-doc@lfdr.de>; Tue,  8 Jun 2021 23:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234861AbhFHV0m (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Jun 2021 17:26:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47236 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234643AbhFHV0Y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 17:26:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623187470;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jeq8qRfoRfsbx4uL9oOz0deeKscRGraAzU6rnmI4bDk=;
        b=GxkaqM3Cf+lORjEVs/ycRRWiFqkfHKDfiF027LswJI54lBhfsj9NQQp0nPa5Hhl65RpmWN
        cR9KrXaOP/SKWKah1STX8lHUud8rWUeLeTWbLroeY82ldBkwDawx6fcrCcnQpsrHaqx7FH
        3WKPf69/+eu94o78xVJdUcTodhPMjTo=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-9nL1K5ooOS-G5zgEzmN-8Q-1; Tue, 08 Jun 2021 17:24:28 -0400
X-MC-Unique: 9nL1K5ooOS-G5zgEzmN-8Q-1
Received: by mail-oo1-f72.google.com with SMTP id r17-20020a4a96510000b029024988968d95so6877552ooi.2
        for <linux-doc@vger.kernel.org>; Tue, 08 Jun 2021 14:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jeq8qRfoRfsbx4uL9oOz0deeKscRGraAzU6rnmI4bDk=;
        b=K/BOPWZvNRssnNZicrgyWlDP5fWdXXB99HxuAet9KLfyYTx0DThxU932jtzJKeWcs2
         bUPt/4oq85VPC9Xa0q90sI1bjYb4ue2kJXLcslE6gA2NO/qNqk6Sp4/ACd/xcw7N+OE4
         ryxRzk/QaVDhFKXKF3Togm2zsoX6uwzLP2EZsmFSdXxUswSlPlaFO52+BV2SDWGHzZ6n
         WV9tpOyl+kEKr24RNYk7HUQ35UnyuIWJ3j4veCKOY2CXS2x4k7VTjRYu3a2QemCGjI5S
         gM+WmN2xTVbzkBO7mwEaXzcCx/aD631JGGwU0F2h1gVQ7w71eevO888PhUa0C3mKzhiw
         Shqw==
X-Gm-Message-State: AOAM530LpR1wo9IhrAeueRIkZYEA10qoFGE18/3zgQ2QNWJ+T/dtqWnZ
        4JrWVSsqH89ugBvpBXGcfxi2Lr5xQHQlAgptnpeepkhbaaULTg6ZLLqQfuY1LDAPOPQO2EFKlYQ
        GLLyn5Bo1+eMCmRQVowcg
X-Received: by 2002:a05:6830:1309:: with SMTP id p9mr12963269otq.209.1623187468231;
        Tue, 08 Jun 2021 14:24:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKsGI5o2pAZuxgtMx6UsQ5GpgFuru3G9QqB8VKcT3CwJSpYN5gRSP28hE4xYJAJAJCEsUFOQ==
X-Received: by 2002:a05:6830:1309:: with SMTP id p9mr12963250otq.209.1623187468089;
        Tue, 08 Jun 2021 14:24:28 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id x199sm1954310oif.5.2021.06.08.14.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 14:24:27 -0700 (PDT)
From:   trix@redhat.com
To:     mdf@kernel.org, robh+dt@kernel.org, hao.wu@intel.com,
        corbet@lwn.net, fbarrat@linux.ibm.com, ajd@linux.ibm.com,
        bbrezillon@kernel.org, arno@natisbad.org, schalla@marvell.com,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        gregkh@linuxfoundation.org, Sven.Auhagen@voleatech.de,
        grandmaster@al2klimov.de
Cc:     linux-fpga@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
        linux-staging@lists.linux.dev, Tom Rix <trix@redhat.com>
Subject: [PATCH 11/11] staging: fpgaboot: change FPGA indirect article to an
Date:   Tue,  8 Jun 2021 14:23:50 -0700
Message-Id: <20210608212350.3029742-13-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210608212350.3029742-1-trix@redhat.com>
References: <20210608212350.3029742-1-trix@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Change use of 'a fpga' to 'an fpga'

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/staging/gs_fpgaboot/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gs_fpgaboot/README b/drivers/staging/gs_fpgaboot/README
index b85a76849fc4a..ec1235a21bcc1 100644
--- a/drivers/staging/gs_fpgaboot/README
+++ b/drivers/staging/gs_fpgaboot/README
@@ -39,7 +39,7 @@ TABLE OF CONTENTS.
 
 5. USE CASE (from a mailing list discussion with Greg)
 
-	a. As a FPGA development support tool,
+	a. As an FPGA development support tool,
 	During FPGA firmware development, you need to download a new FPGA
 	image frequently.
 	You would do that with a dedicated JTAG, which usually a limited
-- 
2.26.3

