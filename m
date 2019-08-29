Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D71AA1C2D
	for <lists+linux-doc@lfdr.de>; Thu, 29 Aug 2019 15:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727454AbfH2N7N (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 29 Aug 2019 09:59:13 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44428 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727626AbfH2N7K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 09:59:10 -0400
Received: by mail-pl1-f193.google.com with SMTP id t14so1605477plr.11
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2019 06:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=40EqMQd0G4SVbrZfGPeA5SE4upLhPO04pKe2ongbivs=;
        b=B7vedP+381Vda1eCJ1DpCKGye34MvOP4SaLRfcWFXrezjckDaL2DCJkysvbc5x6x9K
         5ZHaAq8dolDDtXD5Emsjg2p4yLOStQjh6ER9RX2SxOPJPrpxQ9KcL7NtxmBaNUHUfkqr
         9SWPCrsL1tOOGwTXDBiFQSW/yOhdLnH2Y9d3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=40EqMQd0G4SVbrZfGPeA5SE4upLhPO04pKe2ongbivs=;
        b=rm+dI48Z1FuPsJDKdjzYphKlb88Ujg3BbZ4ha49y7V1rsg8jZwHUqGoEZyQ8/yBAz7
         pxh5TG9IjcF6DNzWp2gQCdBCXM4OsoK9I53e9+v+WzE50DYL4jmAXGOgz0YQA+ReUtdK
         SXO71dOTm1NsJ1ZzxVenXDBeB0dSgjPNKjxYb1gTsudhioTAQmpIzskZzWb3XLbEodOj
         auaB/qREQ/cQ2QpeRFUp+7yxo5KnjwbYOxKHs9feHTzUnEPfTcU5NkqzYVyoZzCkaLtm
         8UVv7rIQ+hFNYJV1S877Um02+gXhUVuBpiH0aaFNKP7HYdJBm6oOt+ETKQzZl+8HCPlr
         Wf+Q==
X-Gm-Message-State: APjAAAWLagis9jg26PYfBrNagZp3zE3YcDy3rO6rGMRXbXqtRTjzOJRG
        YRfdY6oVecITbmZ8vJQ4mdTtDg==
X-Google-Smtp-Source: APXvYqyN3H4PkVt4D8iZLYVpLv8rCMjL0d2y1VW3RXuJ+ApI39d4sYSpewllOECHNz60vokFKp1bBQ==
X-Received: by 2002:a17:902:223:: with SMTP id 32mr10245894plc.220.1567087149497;
        Thu, 29 Aug 2019 06:59:09 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id dw7sm2200431pjb.21.2019.08.29.06.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 06:59:08 -0700 (PDT)
Date:   Thu, 29 Aug 2019 09:59:07 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Frederic Weisbecker <fweisbec@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>, kernel-team@android.com,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        rcu@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [RFC v1 2/2] rcu/tree: Remove dynticks_nmi_nesting counter
Message-ID: <20190829135907.GC63638@google.com>
References: <5d648897.1c69fb81.5e60a.fc70@mx.google.com>
 <20190828202330.GS26530@linux.ibm.com>
 <20190828210525.GB75931@google.com>
 <20190828211904.GX26530@linux.ibm.com>
 <20190828214241.GD75931@google.com>
 <20190828220108.GC26530@linux.ibm.com>
 <20190828221444.GA100789@google.com>
 <20190828231247.GE26530@linux.ibm.com>
 <20190829015155.GB100789@google.com>
 <20190829034336.GD4125@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190829034336.GD4125@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 28, 2019 at 08:43:36PM -0700, Paul E. McKenney wrote:
[snip] 
> On the tracing patch...  That patch might be a good idea regardless,
> but I bet that the reason that you felt the sudden need for it was due
> to the loss of information in your eventual ->dynticks_nesting field.
> After all, the value 0x1 might be an interrupt from idle, or it might
> just as easily be a task running in the kernel at process level.

True, however what really triggered me to do it was the existing code which
does not distinguish between entry/exit from USER and IDLE.

> The reason the patch might nevertheless be a good idea is that redundant
> information can be helpful when debugging.  Especially when debugging
> new architecture-specific code, which is when RCU's dyntick-idle warnings
> tend to find bugs.

Sure, and also that it is more readable to ordinary human beings than "++="
and "--=" :-D.

thanks,

 - Joel

