Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEF642CFE1
	for <lists+linux-doc@lfdr.de>; Tue, 28 May 2019 22:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbfE1UAQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 28 May 2019 16:00:16 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47262 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726988AbfE1UAQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 May 2019 16:00:16 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4SJsWbU129462
        for <linux-doc@vger.kernel.org>; Tue, 28 May 2019 16:00:15 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2ss8u1q72q-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Tue, 28 May 2019 16:00:15 -0400
Received: from localhost
        by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Tue, 28 May 2019 21:00:13 +0100
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
        by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Tue, 28 May 2019 21:00:09 +0100
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
        by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x4SK082Z37290332
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 28 May 2019 20:00:08 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 98419B2065;
        Tue, 28 May 2019 20:00:08 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7370BB206A;
        Tue, 28 May 2019 20:00:08 +0000 (GMT)
Received: from paulmck-ThinkPad-W541 (unknown [9.70.82.216])
        by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue, 28 May 2019 20:00:08 +0000 (GMT)
Received: by paulmck-ThinkPad-W541 (Postfix, from userid 1000)
        id 22C5716C2983; Tue, 28 May 2019 13:00:14 -0700 (PDT)
Date:   Tue, 28 May 2019 13:00:14 -0700
From:   "Paul E. McKenney" <paulmck@linux.ibm.com>
To:     Joel Fernandes <joel@joelfernandes.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>, kvm-ppc@vger.kernel.org,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>, rcu@vger.kernel.org
Subject: Re: [PATCH RFC 0/5] Remove some notrace RCU APIs
Reply-To: paulmck@linux.ibm.com
References: <20190524234933.5133-1-joel@joelfernandes.org>
 <20190524232458.4bcf4eb4@gandalf.local.home>
 <20190525081444.GC197789@google.com>
 <20190525070826.16f76ee7@gandalf.local.home>
 <20190525141954.GA176647@google.com>
 <20190525155035.GE28207@linux.ibm.com>
 <20190525181407.GA220326@google.com>
 <20190528122447.GS28207@linux.ibm.com>
 <20190528190007.GC252809@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190528190007.GC252809@google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 19052820-0072-0000-0000-0000043450AF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011176; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01209932; UDB=6.00635641; IPR=6.00990962;
 MB=3.00027090; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-28 20:00:13
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052820-0073-0000-0000-00004C660678
Message-Id: <20190528200014.GV28207@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-28_09:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905280124
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 28, 2019 at 03:00:07PM -0400, Joel Fernandes wrote:
> On Tue, May 28, 2019 at 05:24:47AM -0700, Paul E. McKenney wrote:
> > On Sat, May 25, 2019 at 02:14:07PM -0400, Joel Fernandes wrote:
> > > On Sat, May 25, 2019 at 08:50:35AM -0700, Paul E. McKenney wrote:
> > > > On Sat, May 25, 2019 at 10:19:54AM -0400, Joel Fernandes wrote:
> > > > > On Sat, May 25, 2019 at 07:08:26AM -0400, Steven Rostedt wrote:
> > > > > > On Sat, 25 May 2019 04:14:44 -0400
> > > > > > Joel Fernandes <joel@joelfernandes.org> wrote:
> > > > > > 
> > > > > > > > I guess the difference between the _raw_notrace and just _raw variants
> > > > > > > > is that _notrace ones do a rcu_check_sparse(). Don't we want to keep
> > > > > > > > that check?  
> > > > > > > 
> > > > > > > This is true.
> > > > > > > 
> > > > > > > Since the users of _raw_notrace are very few, is it worth keeping this API
> > > > > > > just for sparse checking? The API naming is also confusing. I was expecting
> > > > > > > _raw_notrace to do fewer checks than _raw, instead of more. Honestly, I just
> > > > > > > want to nuke _raw_notrace as done in this series and later we can introduce a
> > > > > > > sparse checking version of _raw if need-be. The other option could be to
> > > > > > > always do sparse checking for _raw however that used to be the case and got
> > > > > > > changed in http://lists.infradead.org/pipermail/linux-afs/2016-July/001016.html
> > > > > > 
> > > > > > What if we just rename _raw to _raw_nocheck, and _raw_notrace to _raw ?
> > > > > 
> > > > > That would also mean changing 160 usages of _raw to _raw_nocheck in the
> > > > > kernel :-/.
> > > > > 
> > > > > The tracing usage of _raw_notrace is only like 2 or 3 users. Can we just call
> > > > > rcu_check_sparse directly in the calling code for those and eliminate the APIs?
> > > > > 
> > > > > I wonder what Paul thinks about the matter as well.
> > > > 
> > > > My thought is that it is likely that a goodly number of the current uses
> > > > of _raw should really be some form of _check, with lockdep expressions
> > > > spelled out.  Not that working out what exactly those lockdep expressions
> > > > should be is necessarily a trivial undertaking.  ;-)
> > > 
> > > Yes, currently where I am a bit stuck is the rcu_dereference_raw()
> > > cannot possibly know what SRCU domain it is under, so lockdep cannot check if
> > > an SRCU lock is held without the user also passing along the SRCU domain. I
> > > am trying to change lockdep to see if it can check if *any* srcu domain lock
> > > is held (regardless of which one) and complain if none are. This is at least
> > > better than no check at all.
> > > 
> > > However, I think it gets tricky for mutexes. If you have something like:
> > > mutex_lock(some_mutex);
> > > p = rcu_dereference_raw(gp);
> > > mutex_unlock(some_mutex);
> > > 
> > > This might be a perfectly valid invocation of _raw, however my checks (patch
> > > is still cooking) trigger a lockdep warning becase _raw cannot know that this
> > > is Ok. lockdep thinks it is not in a reader section. This then gets into the
> > > territory of a new rcu_derference_raw_protected(gp, assert_held(some_mutex))
> > > which sucks because its yet another API. To circumvent this issue, can we
> > > just have callers of rcu_dereference_raw ensure that they call
> > > rcu_read_lock() if they are protecting dereferences by a mutex? That would
> > > make things a lot easier and also may be Ok since rcu_read_lock is quite
> > > cheap.
> > 
> > Why not just rcu_dereference_protected(lockdep_is_held(some_mutex))?
> > The API is already there, and no need for spurious readers.
> 
> Hmm, so I gave a bad example, here is a better example:
> 
> fib_get_table calls hlist_for_each_entry_rcu()
> hlist_for_each_entry_rcu calls rcu_dereference_raw().
> 
> This is perfectly Ok to be called under rtnl_mutex. However rcu_dererence_raw
> in hlist_for_each_entry_rcu has no way of knowing that the rtnl_mutex held is
> sufficient for the protection since it is not directly called by the caller.

Agreed, and this just happens to be one of the use cases that led to
rcu_dereference_raw().  The calling code (in this case, FIB) simply has
no idea what the synchronization strategy might be.

> I am almost sure I saw other examples of rcu_dereference_raw being called
> this way as well.

And I am OK with this sort of use case.  The ones I am less happy with
are the ones where there really is a lockdep expression that could be
constructed.

> I was trying to make an "automatic" lockdep check for all this, but it is
> quite hard to do so without passing down lockdep experessions down a call
> chain thus complicating all such callchains.

Understood!  Not an easy task.

> Further I don't think code can trivially be converted from
> rcu_dereference_raw to rcu_dereference_protected even if the protection being
> offered is known, since the former does not do sparse checking and the latter
> might trigger false sparse checks in case the pointer in concern is protected
> both by RCU and non-RCU methods. I believe this is why you removed sparse
> checking from rcu_dereference_raw as well:
> 
> http://lists.infradead.org/pipermail/linux-afs/2016-July/001016.html

Good point!

> > > > That aside, if we are going to change the name of an API that is
> > > > used 160 places throughout the tree, we would need to have a pretty
> > > > good justification.  Without such a justification, it will just look
> > > > like pointless churn to the various developers and maintainers on the
> > > > receiving end of the patches.
> > > 
> > > Actually, the API name change is not something I want to do, it is Steven
> > > suggestion. My suggestion is let us just delete _raw_notrace and just use the
> > > _raw API for tracing, since _raw doesn't do any tracing anyway. Steve pointed
> > > that _raw_notrace does sparse checking unlike _raw, but I think that isn't an
> > > issue since _raw doesn't do such checking at the moment anyway.. (if possible
> > > check my cover letter again for details/motivation of this series).
> > 
> > Understood, but regardless of who suggested it, if we are to go through
> > with it, good justification will be required.  ;-)
> 
> Ok ;-). About the names of the APIs, I thought of leaving rcu_dereference_raw
> and its callers intact, and just rename:
> 
>  * hlist_for_each_entry_rcu_notrace
>  * rcu_dereference_raw_notrace
> 
> to:
>  * hlist_for_each_entry_rcu_sparse
>  * rcu_dereference_raw_sparse
> 
> The _sparse would stand for "sparse checking". However I am open to better
> names..
> 
> Such renaming would avoid confusion and keep the fact about sparse checking
> less ambiguous.

Let's give people a few days to propose different names, and if nothing
compelling, those names look good.  There are not very many of them, so
the penalty for having to rename is quite low.

							Thanx, Paul

