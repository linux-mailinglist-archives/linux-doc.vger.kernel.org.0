Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91D884153F7
	for <lists+linux-doc@lfdr.de>; Thu, 23 Sep 2021 01:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238501AbhIVXh2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 22 Sep 2021 19:37:28 -0400
Received: from zeniv-ca.linux.org.uk ([142.44.231.140]:56190 "EHLO
        zeniv-ca.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238464AbhIVXh0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Sep 2021 19:37:26 -0400
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mTBmI-006Y8s-Sm; Wed, 22 Sep 2021 23:35:50 +0000
Date:   Wed, 22 Sep 2021 23:35:50 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     David Disseldorp <ddiss@suse.de>
Cc:     linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        willy@infradead.org
Subject: Re: [PATCH 1/5] initramfs: move unnecessary memcmp from hot path
Message-ID: <YUu91kH8kOcVHxyb@zeniv-ca.linux.org.uk>
References: <20210922115222.8987-1-ddiss@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922115222.8987-1-ddiss@suse.de>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 22, 2021 at 01:52:18PM +0200, David Disseldorp wrote:
> do_header() is called for each cpio entry and first checks for "newc"
> magic before parsing further. The magic check includes a special case
> error message if POSIX.1 ASCII (cpio -H odc) magic is detected. This
> special case POSIX.1 check needn't be done in the hot path, so move it
> under the non-newc-magic error path.

You keep refering to hot paths; do you have any data to support that
assertion?

How much does that series buy you on average, and what kind of dispersion
do you get before and after it?

I'm not saying I hate the patches themselves, but those references in commit
messages ping my BS detectors every time I see them ;-/
