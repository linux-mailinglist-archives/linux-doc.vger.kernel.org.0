Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD1C543BC9E
	for <lists+linux-doc@lfdr.de>; Tue, 26 Oct 2021 23:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237354AbhJZVqt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 26 Oct 2021 17:46:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:35252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237248AbhJZVqs (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 26 Oct 2021 17:46:48 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8CBB360EDF;
        Tue, 26 Oct 2021 21:44:22 +0000 (UTC)
Date:   Tue, 26 Oct 2021 17:44:20 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Kalesh Singh <kaleshsingh@google.com>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>, surenb@google.com,
        hridya@google.com, namhyung@kernel.org, kernel-team@android.com,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Tom Zanussi <zanussi@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 7/8] tracing/selftests: Add tests for hist trigger
 expression parsing
Message-ID: <20211026174420.0056bde2@gandalf.local.home>
In-Reply-To: <CAC_TJvfQQCyuSZqjzC0fuAah84uLgHJv5T+WtR8=9h5fN9nrLA@mail.gmail.com>
References: <20211025200852.3002369-1-kaleshsingh@google.com>
        <20211025200852.3002369-8-kaleshsingh@google.com>
        <20211026214311.583c728d90d41778c38201dd@kernel.org>
        <CAC_TJvfQQCyuSZqjzC0fuAah84uLgHJv5T+WtR8=9h5fN9nrLA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 26 Oct 2021 07:28:39 -0700
Kalesh Singh <kaleshsingh@google.com> wrote:

> > If this update has any meaning, please make a separate patch for this part.  
> 
> Hi Masami,
> 
> Thanks for the feedback. The above change is to ensure we remove
> triggers in the reverse order that we created them - important when
> one trigger depends on another. I can split it out into a separate
> patch and will add a README pattern check to the requires tag for
> these tests.

Also make sure to run all the ftracetests. When I ran it with this update,
most of the other histogram tests failed. Even with your patches applied to
the running kernel.

-- Steve
