Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E48E57A0CD
	for <lists+linux-doc@lfdr.de>; Tue, 19 Jul 2022 16:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238590AbiGSOK6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Jul 2022 10:10:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238600AbiGSOKW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jul 2022 10:10:22 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55AE66375;
        Tue, 19 Jul 2022 06:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
        Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
        In-Reply-To:References; bh=1x31u2WlPHDowNIXHmwkgfRsySDXsC/O1DbyHwa3AbE=; b=Iw
        hwXibHeeFK7rTMGpz9bJOrnqjHFAUOk67CodcG2HRr9coaDgE4jn45Q/l7I4YHPYhF1XCqzt/8kDo
        C3alHfDivK579ssgv0W3Z1pDtVF23OU+O3TKG0PR3YuQ12aeZueIUWhODxOh3M3VDCLI2W/2oikZz
        F2WUh5HwqrPp7yg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1oDmwC-00AowE-IR; Tue, 19 Jul 2022 15:06:56 +0200
Date:   Tue, 19 Jul 2022 15:06:56 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mauri Sandberg <maukka@ext.kapsi.fi>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: arm: marvell: Add Orion codenames and
 archive homepage
Message-ID: <YtascOOoRiZtRlpH@lunn.ch>
References: <20220719080807.16729-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220719080807.16729-1-pali@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 19, 2022 at 10:08:07AM +0200, Pali Roh�r wrote:
> Orion codenames are extracted from menuconfig ARCH_ORION5X and
> old Orion homepage with 88F5182/88F5281 was found in web archive.
> 
> Signed-off-by: Pali Roh�r <pali@kernel.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
