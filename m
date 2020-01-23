Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8DFB1461B1
	for <lists+linux-doc@lfdr.de>; Thu, 23 Jan 2020 06:55:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbgAWFzL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 23 Jan 2020 00:55:11 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:52212 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbgAWFzL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Jan 2020 00:55:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=x+tl0buwkubh0DyQEprytmPxurFxgOAOtj6qON+IDDM=; b=E5hcdab6878nRKkFe5olgaeoV
        SrnvwmKLhOkwnU/oKsRnxKA4pY9zx+hbTjXc+/rJueCYkXfVzo8yYhwW5PMEJeEeR0P/5htEFH8C/
        TwjEegJV6u6Xl0QVbM+BNH2W/G2xCsY8+389CgNGmvufb/WX3tRxpYm0WNpLBTXhZHmIE2uf/MZfu
        se7QW1pSpbsZVLU90365v5Nk8u6CvRz5hs+i5tYS4WWi2WoN3E3QsCm15cL6cqHz0CIPMdngzaaXu
        3uamkXjr5BWb7VNczGqETTgv0p0zQ6nWrgzyUybwBGDf7SVtyxnqAy7N14uzGrvTg2jxEI9HY/nqQ
        9+ah3SrPw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iuVSR-0003q5-0w; Thu, 23 Jan 2020 05:55:11 +0000
Date:   Wed, 22 Jan 2020 21:55:10 -0800
From:   Matthew Wilcox <willy@infradead.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] Add a maintainer entry profile for Documentation/
Message-ID: <20200123055510.GF4675@bombadil.infradead.org>
References: <20200122162140.6a13e6a9@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200122162140.6a13e6a9@lwn.net>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 22, 2020 at 04:21:40PM -0700, Jonathan Corbet wrote:
> +The documentation subsystem has a single maintainer who is doing the work
> +on his own time, so the response to patches will occasionally be slow.  I
> +try to always send out a notification when a patch is merged (or when I
> +decide that one cannot be).  Do not hesitate to send a ping if you have not
> +heard back within a week of sending a patch.

Odd change of person in this paragraph ... should it be first or second?
