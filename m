Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DCD81764B7
	for <lists+linux-doc@lfdr.de>; Mon,  2 Mar 2020 21:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbgCBUNx (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 2 Mar 2020 15:13:53 -0500
Received: from ms.lwn.net ([45.79.88.28]:58548 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbgCBUNx (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 2 Mar 2020 15:13:53 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0D27A2E4;
        Mon,  2 Mar 2020 20:13:53 +0000 (UTC)
Date:   Mon, 2 Mar 2020 13:13:51 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH v3] Documentation: bootconfig: Update boot configuration
 documentation
Message-ID: <20200302131351.1b51a58e@lwn.net>
In-Reply-To: <20200302150802.348b814e@gandalf.local.home>
References: <158313621831.3082.9886161529613724376.stgit@devnote2>
        <158313622831.3082.8237132211731864948.stgit@devnote2>
        <20200302125033.4a62e88e@lwn.net>
        <20200302150802.348b814e@gandalf.local.home>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 2 Mar 2020 15:08:02 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> > So I tried to apply this but failed - it's built on other changes to
> > bootconfig.rst that went into linux-next via Steve's tree.  So Steve,
> > would you like to take this one too?  
> 
> All my changes in linux-next have already hit Linus's tree. I haven't
> started pushing my next merge window changes yet. Are you up to date with
> Linus?

I try not to do too many backmerges with mainline, so no.  I can pull
forward if I have to, I guess.

jon
