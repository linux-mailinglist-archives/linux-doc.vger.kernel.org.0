Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 142252210D2
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2020 17:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbgGOPZh (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 15 Jul 2020 11:25:37 -0400
Received: from seldsegrel01.sonyericsson.com ([37.139.156.29]:15017 "EHLO
        SELDSEGREL01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725770AbgGOPZh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Jul 2020 11:25:37 -0400
From:   Peter Enderborg <peter.enderborg@sony.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>
Subject: [PATCH v6 0/2] debugfs: Add access restriction option
Date:   Wed, 15 Jul 2020 17:25:27 +0200
Message-ID: <20200715152529.11223-1-peter.enderborg@sony.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200617133738.6631-1-peter.enderborg@sony.com>
References: <20200617133738.6631-1-peter.enderborg@sony.com>
MIME-Version: 1.0
Content-Type: text/plain
X-SEG-SpamProfiler-Analysis: v=2.3 cv=CszBjUwD c=1 sm=1 tr=0 a=kIrCkORFHx6JeP9rmF/Kww==:117 a=_RQrkK6FrEwA:10 a=QyXUC8HyAAAA:8 a=rwTvC7ucDngX97v92ZIA:9
X-SEG-SpamProfiler-Score: 0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since debugfs include sensitive information it need to be treated
carefully. But it also has many very useful debug functions for userspace.
With this option we can have same configuration for system with
need of debugfs and a way to turn it off. This gives a extra protection
for exposure on systems where user-space services with system
access are attacked.

v2. Removed MOUNT as part of restrictions. Added API's restrictions as
    separate restriction.
v3  Updated Documentation after Randy Dunlap reviews and suggestions.
v4  Removed #ifdefs from inode.c and using internal.h for configuration
    and now using BIT() for that. Function is now always on, and are
    instead selected by a built in default or command line parameter.
    Changed return value on debug_mount
    Reported-by: kernel test robot <lkp@intel.com>
    Im not sure about that it is right
v5  Added notes to config help suggested by GregKH.
    Removed _BIT from names, white-space and tab.
    (checkpatch did not complain).
v6  Using ALLOW instead of ACCESS as name on BIT's. Change the fs to
    mount to make it clear and easy to understand. 


