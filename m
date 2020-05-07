Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AFB71C99F5
	for <lists+linux-doc@lfdr.de>; Thu,  7 May 2020 20:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728309AbgEGSx3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 7 May 2020 14:53:29 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:26078 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbgEGSx2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 May 2020 14:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588877608;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3EhH1A9gQMpfXypIl8DH4medFGIIF5ti8TqIyHhZSE0=;
        b=BXlVtRcWij/ctbsmQytQsH6uUE6s99R0al+ovXxaSeCRu3D7fmCF9xSBGBgZB0qOmPprWR
        c6Vho2jXVdP6Gjkqnk2xEIBGX60Zk+u9A8jxNyP0YZ/v4Ha/ct+X18z9iQ/T0CsNTq8+2W
        3tyIXSqyGsLCHw+YFk+4WPS1oJUz1aA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-Y-p7Je82PyWfiDY1P6m7tw-1; Thu, 07 May 2020 14:53:26 -0400
X-MC-Unique: Y-p7Je82PyWfiDY1P6m7tw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E09E107ACCD;
        Thu,  7 May 2020 18:53:24 +0000 (UTC)
Received: from optiplex-lnx (unknown [10.3.128.26])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id E7A721001B07;
        Thu,  7 May 2020 18:53:18 +0000 (UTC)
Date:   Thu, 7 May 2020 14:53:15 -0400
From:   Rafael Aquini <aquini@redhat.com>
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kexec@lists.infradead.org, linux-fsdevel@vger.kernel.org,
        dyoung@redhat.com, bhe@redhat.com, corbet@lwn.net,
        keescook@chromium.org, akpm@linux-foundation.org, cai@lca.pw,
        rdunlap@infradead.org
Subject: Re: [PATCH v2] kernel: add panic_on_taint
Message-ID: <20200507185315.GH205881@optiplex-lnx>
References: <20200507180631.308441-1-aquini@redhat.com>
 <20200507185046.GY11244@42.do-not-panic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507185046.GY11244@42.do-not-panic.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 07, 2020 at 06:50:46PM +0000, Luis Chamberlain wrote:
> On Thu, May 07, 2020 at 02:06:31PM -0400, Rafael Aquini wrote:
> > Another, perhaps less frequent, use for this option would be
> > as a mean for assuring a security policy (in paranoid mode)
> > case where no single taint is allowed for the running system.
> 
> If used for this purpose then we must add a new TAINT flag for
> proc_taint() was used, otherwise we can cheat to show a taint
> *did* happen, where in fact it never happened, some punk just
> echo'd a value into the kernel's /proc/sys/kernel/tainted.
>

To accomplish that, the punk would need to be root, though, in which 
case everything else is doomed, already.
 
> Forunately proc_taint() only allows to *increment* the taint, not
> reduce.
> 
>   Luis
> 

