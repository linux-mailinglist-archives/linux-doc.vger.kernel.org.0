Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 967FB18BF85
	for <lists+linux-doc@lfdr.de>; Thu, 19 Mar 2020 19:42:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgCSSmU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 19 Mar 2020 14:42:20 -0400
Received: from ms.lwn.net ([45.79.88.28]:35016 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726589AbgCSSmU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 19 Mar 2020 14:42:20 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 453FF384;
        Thu, 19 Mar 2020 18:42:20 +0000 (UTC)
Date:   Thu, 19 Mar 2020 12:42:19 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Federico Vaga <federico.vaga@vaga.pv.it>
Cc:     linux-doc@vger.kernel.org
Subject: Re: Sphinx Use Of 'autosectionlabel'
Message-ID: <20200319124219.3a834f99@lwn.net>
In-Reply-To: <1651548.KylsOV6ox4@harkonnen>
References: <1651548.KylsOV6ox4@harkonnen>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 15 Mar 2020 20:15:04 +0100
Federico Vaga <federico.vaga@vaga.pv.it> wrote:

> a while ago we had a chat about the sphinx option 
> 'sphinx.ext.autosectionlabel'
> 
> https://lkml.org/lkml/2019/11/24/85
> 
> I can't see this patch in "docs-next". Are you planning to apply it, or should 
> I continue to use/add labels?

This means that I simply lost track of the whole thing.  I think it makes
sense to do this, let me go dig up that patch...

Thanks,

jon
