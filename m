Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E66FF8A888
	for <lists+linux-doc@lfdr.de>; Mon, 12 Aug 2019 22:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbfHLUmI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 12 Aug 2019 16:42:08 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36654 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbfHLUmI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Aug 2019 16:42:08 -0400
Received: by mail-pl1-f196.google.com with SMTP id g4so1846394plo.3
        for <linux-doc@vger.kernel.org>; Mon, 12 Aug 2019 13:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HB3fJfLK4PnVLPAunkiBcGzstN0wP/veN+x35xEeTW4=;
        b=Xe1HCglzqQ/jt0qNR/aglTK1b4gWyuldTqcJGOCn2p8MviY8GjAePqFA8W6qXYNWwh
         2cixQe7Xk+CMRlinmlShEIITwIG+/yKYjpZ4tXo+xdxjqX6r2AXuhjY1AXgfF/+pPLpt
         3H4FA7FbPHHMEjZxSLeUZCOeIzQH+QoS9hGTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HB3fJfLK4PnVLPAunkiBcGzstN0wP/veN+x35xEeTW4=;
        b=sQ1UOd4Ee2qfDzHYiVV0T9YOabytNoSmdzjxZM8bAOqKQ8ODx33gk67e1PUu8CK8S2
         T/zM3ndpi6/SegwYDna0Sgv33G+KmMQeV9V6nb/1xN77DRGB1DVx2cp4c60m7MoWNayc
         JRC9xxBnuW+zn5aEa7snzBNb7sc7DkjYTdrW5NHuxWAZ8CjKCnLLf+kr4ZbpsvjJlX56
         F3fhTtUlbCHNrIyC2tKpDI2Vg1LHDuUvLFZNINoGywuWQhdLVLo3bb2gKL7yX/VxOy5n
         5yRoqikaHqjWK0H8UAMlR9eRJ5zx1lDQs2maq799uJZoX1SjHyRHJ8cSlhnbSzK2XlG6
         4E7g==
X-Gm-Message-State: APjAAAUJ0EbbAo74wcM1fblJzu99oQ3QCusoM3rCd0Sodn1HnCL0iESf
        SUlII4P0M8CzEl0lg2pAT1r4CA==
X-Google-Smtp-Source: APXvYqzPYpjVmv8OPuJ7/zhwmE1fv9Mj7f2m91Oz+OJyXmJx2LhgvftlfMirHjQRBKJSR4vGQbrjbw==
X-Received: by 2002:a17:902:1004:: with SMTP id b4mr23932384pla.340.1565642527441;
        Mon, 12 Aug 2019 13:42:07 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id a4sm2991210pfi.55.2019.08.12.13.42.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 13:42:06 -0700 (PDT)
Date:   Mon, 12 Aug 2019 16:42:05 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc:     linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, rcu@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>, Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 2/3] doc: Update documentation about
 list_for_each_entry_rcu (v1)
Message-ID: <20190812204205.GA48751@google.com>
References: <20190811221111.99401-1-joel@joelfernandes.org>
 <20190811221111.99401-2-joel@joelfernandes.org>
 <20190812202241.GP28441@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812202241.GP28441@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Aug 12, 2019 at 01:22:41PM -0700, Paul E. McKenney wrote:
> On Sun, Aug 11, 2019 at 06:11:10PM -0400, Joel Fernandes (Google) wrote:
> > This patch updates the documentation with information about
> > usage of lockdep with list_for_each_entry_rcu().
> > 
> > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> 
> Thank you!!!
> 
> I queued this for v5.5 with the following wordsmithing.  Please check
> to make sure that I didn't mess anything up.

Yes, this looks great to me. thanks!

Also, I will send out the other drivers/core patch of this series in a bit
with Steve's suggestion.

 - Joel

[snip]
