Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D75E210E2DF
	for <lists+linux-doc@lfdr.de>; Sun,  1 Dec 2019 19:16:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbfLASQM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 1 Dec 2019 13:16:12 -0500
Received: from mtax.cdmx.gob.mx ([187.141.35.197]:15297 "EHLO mtax.cdmx.gob.mx"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727296AbfLASQL (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 1 Dec 2019 13:16:11 -0500
X-Greylist: delayed 6386 seconds by postgrey-1.27 at vger.kernel.org; Sun, 01 Dec 2019 13:16:10 EST
X-NAI-Header: Modified by McAfee Email Gateway (4500)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cdmx.gob.mx; s=72359050-3965-11E6-920A-0192F7A2F08E;
        t=1575217563; h=DKIM-Filter:X-Virus-Scanned:
         Content-Type:MIME-Version:Content-Transfer-Encoding:
         Content-Description:Subject:To:From:Date:Message-Id:
         X-AnalysisOut:X-AnalysisOut:X-AnalysisOut:
         X-AnalysisOut:X-AnalysisOut:X-SAAS-TrackingID:
         X-NAI-Spam-Flag:X-NAI-Spam-Threshold:X-NAI-Spam-Score:
         X-NAI-Spam-Rules:X-NAI-Spam-Version; bh=M
        8rWdUYQ57RAYAgTWJQ4Rsch0kO0UXllaAVDzocOs4
        8=; b=gdGvDiNUKiUhilfj4ftj21FaCYGQYX8q7FNvKplgkaPj
        MclqfAugOxvgInLV/270KWG+vqemlr2xO+f6X4+9iFSsz7h3U4
        GWBads6s3rlMD6Xhtx0Tz/G9q1LtwMJTuciz56UoGrt6L/7XGd
        C/aSolCvQj6X2BOmbA6h3OLSY6Y=
Received: from cdmx.gob.mx (correo.cdmx.gob.mx [10.250.108.150]) by mtax.cdmx.gob.mx with smtp
        (TLS: TLSv1/SSLv3,256bits,ECDHE-RSA-AES256-GCM-SHA384)
         id 28cd_468d_6594afac_edb4_45b9_aed5_ec2a71494602;
        Sun, 01 Dec 2019 10:26:02 -0600
Received: from localhost (localhost [127.0.0.1])
        by cdmx.gob.mx (Postfix) with ESMTP id 4DE351E2830;
        Sun,  1 Dec 2019 10:18:01 -0600 (CST)
Received: from cdmx.gob.mx ([127.0.0.1])
        by localhost (cdmx.gob.mx [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Kpa1fxuy2Y4E; Sun,  1 Dec 2019 10:18:01 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
        by cdmx.gob.mx (Postfix) with ESMTP id 13F411E27CC;
        Sun,  1 Dec 2019 10:12:52 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.9.2 cdmx.gob.mx 13F411E27CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cdmx.gob.mx;
        s=72359050-3965-11E6-920A-0192F7A2F08E; t=1575216772;
        bh=M8rWdUYQ57RAYAgTWJQ4Rsch0kO0UXllaAVDzocOs48=;
        h=Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:
         From:Date:Message-Id;
        b=ggUkghrfP/xQbNONi1s3Pjb+pHbQMDmrw0t6hdMqCHw0/MDTWJIm42Sjw92OKXN0c
         M6ZXyWcNIz0w1dmNEkIDzaVw/UsKiSZDdHn0lPtukMScrNfB1A8IYfjWgXlCrP8hB8
         Yhen5lx9qYVf9rhCSzBTL4aWQMRr62M3wiKyG0Rk=
X-Virus-Scanned: amavisd-new at cdmx.gob.mx
Received: from cdmx.gob.mx ([127.0.0.1])
        by localhost (cdmx.gob.mx [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 0ZkBS3VzSp8w; Sun,  1 Dec 2019 10:12:52 -0600 (CST)
Received: from [192.168.0.104] (unknown [188.125.168.160])
        by cdmx.gob.mx (Postfix) with ESMTPSA id E73301E269F;
        Sun,  1 Dec 2019 10:03:46 -0600 (CST)
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Congratulations
To:     Recipients <aac-styfe@cdmx.gob.mx>
From:   "Bishop Johnr" <aac-styfe@cdmx.gob.mx>
Date:   Sun, 01 Dec 2019 17:03:38 +0100
Message-Id: <20191201160346.E73301E269F@cdmx.gob.mx>
X-AnalysisOut: [v=2.2 cv=U7TiNaju c=1 sm=1 tr=0 p=6K-Ig8iNAUou4E5wYCEA:9 p]
X-AnalysisOut: [=zRI05YRXt28A:10 a=T6zFoIZ12MK39YzkfxrL7A==:117 a=9152RP8M]
X-AnalysisOut: [6GQqDhC/mI/QXQ==:17 a=8nJEP1OIZ-IA:10 a=pxVhFHJ0LMsA:10 a=]
X-AnalysisOut: [pGLkceISAAAA:8 a=wPNLvfGTeEIA:10 a=M8O0W8wq6qAA:10 a=Ygvjr]
X-AnalysisOut: [iKHvHXA2FhpO6d-:22]
X-SAAS-TrackingID: 899e3ed5.0.104999800.00-2374.176568161.s12p02m005.mxlogic.net
X-NAI-Spam-Flag: NO
X-NAI-Spam-Threshold: 3
X-NAI-Spam-Score: -5000
X-NAI-Spam-Rules: 1 Rules triggered
        WHITELISTED=-5000
X-NAI-Spam-Version: 2.3.0.9418 : core <6686> : inlines <7165> : streams
 <1840193> : uri <2949749>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Money was donated to you by Mr and Mrs Allen and Violet Large, just contact=
 them with this email for more information =


EMail: allenandvioletlargeaward@gmail.com
