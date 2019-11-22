Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF861066C8
	for <lists+linux-doc@lfdr.de>; Fri, 22 Nov 2019 08:05:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbfKVHFD (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 22 Nov 2019 02:05:03 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:35437 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbfKVHFD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 22 Nov 2019 02:05:03 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <rsc@pengutronix.de>)
        id 1iY300-0007Zp-9F; Fri, 22 Nov 2019 08:05:00 +0100
Received: from rsc by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <rsc@pengutronix.de>)
        id 1iY2zz-0003oQ-8P; Fri, 22 Nov 2019 08:04:59 +0100
Date:   Fri, 22 Nov 2019 08:04:59 +0100
From:   Robert Schwebel <r.schwebel@pengutronix.de>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 5/5] docs: networking: nfc: change to rst format
Message-ID: <20191122070459.j7qdrcft53lvhnir@pengutronix.de>
References: <20191121155503.52019-1-r.schwebel@pengutronix.de>
 <20191121155503.52019-5-r.schwebel@pengutronix.de>
 <20191121101027.3c060dbe@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191121101027.3c060dbe@lwn.net>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:04:04 up 137 days, 13:14, 128 users,  load average: 0,03, 0,17,
 0,13
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: rsc@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 21, 2019 at 10:10:27AM -0700, Jonathan Corbet wrote:
> > Now that the sphinx syntax has been fixed, change the document from txt
> > to rst and add it to the index.
> >
> > [...]
> >
> > diff --git a/Documentation/networking/nfc.txt b/Documentation/networking/nfc.rst
> > similarity index 100%
> > rename from Documentation/networking/nfc.txt
> > rename to Documentation/networking/nfc.rst
> 
> It looks like you didn't actually add it to index.rst?

Whoops, that got lost, will change.

rsc
-- 
Pengutronix e.K.                           | Dipl.-Ing. Robert Schwebel  |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
