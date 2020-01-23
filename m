Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 012E6147408
	for <lists+linux-doc@lfdr.de>; Thu, 23 Jan 2020 23:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729400AbgAWWu5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 23 Jan 2020 17:50:57 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:54460 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729259AbgAWWu5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Jan 2020 17:50:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=rEeYIoKS6gKsDEFbw3Q5wYHd8KhTNl5UlZH2840j3sM=; b=mdU8ddhkcgoY5E7KSb9oQ7GNz
        J+G9rp0VYawXABrQbH3bti9x/wAgIVgd3YyeKL//Iv9PA78S/lkIfEuxOka8ltdDB51/JzLGyUins
        RF5WiJc7uzcm8hCkB8ErwLQFff+/v93Ov7wnr1T0KjzTd3NgAvpq1/mRJXfulXq+7c6ImDF/sDWQX
        6fx/SC7EAjG5jbh2+B2+J0UIaUYW3QEekwZI+QzAtMscSiaDsodSVVfntfI1OoN4q2NiDaaqmojio
        iOEjKqruqlnV2xDB7yXqtfN3iJ2XJSa3HmNMd0VngbvkLPpYWVTjruM2Rv7alHBdmHXcFOXSXGCb7
        D/6tunx2A==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iulJQ-0007oZ-S4; Thu, 23 Jan 2020 22:50:56 +0000
Date:   Thu, 23 Jan 2020 14:50:56 -0800
From:   Matthew Wilcox <willy@infradead.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] Add a maintainer entry profile for documentation
Message-ID: <20200123225056.GI4675@bombadil.infradead.org>
References: <20200123150149.333439d7@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200123150149.333439d7@lwn.net>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 23, 2020 at 03:01:49PM -0700, Jonathan Corbet wrote:
> Documentation should lead by example, so here's a basic maintainer entry
> profile for this subsystem.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
